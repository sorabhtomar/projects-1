package com.retail.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.retail.store.dto.CartDto;
import com.retail.store.dto.CartItemDto;
import com.retail.store.model.Cart;
import com.retail.store.model.CartItem;
import com.retail.store.model.Product;
import com.retail.store.model.User;
import com.retail.store.repository.CartRepository;
import com.retail.store.repository.ProductRepository;
import com.retail.store.repository.UserRepository;

@Component
public class CartService {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private CartRepository cartRepo;

    @Autowired
    private ProductRepository productRepo;

    public void addProduct(long userId, long productId, int quantity) {
        Cart cart = getCart(userId);

        CartItem cartItem = createCartItem(productId, quantity, cart);
        cart.addItem(cartItem);

        cartRepo.save(cart);
    }

    public Cart getCart(Long userId) {
        User user = userRepo.getOne(userId);
        return getCart(user);
    }

    public Cart getCart(User user) {
        Cart cart = user.getCart();
        if (cart == null) {
            cart = new Cart();
            user.setCart(cart);
        }
        return cart;
    }

    private CartItem createCartItem(long productId, int quantity, Cart cart) {
        Product product = productRepo.getOne(productId);
        return new CartItem(product, quantity);
    }

    public CartDto getCartByUserId(Long userId) {
        User user = userRepo.getOne(userId);
        Cart cart = user.getCart();
        if (cart == null) {
            return new CartDto(userId);
        }
        CartDto cartDto = new CartDto(userId);
        cartDto.setTotalPrice(cart.getTotalPrice());
        cartDto.setTotalSalesTax(cart.getTotalSalesTax());
        cartDto.setGrandTotal(cart.getGrandTotal());

        for (CartItem item : cart.getCartItems()) {
            cartDto.getCartItems().add(
                new CartItemDto(item.getId(), item.getProduct(), item.getQuantity(), item.getSalesTax(), item.getPrice()));
        }
        return cartDto;
    }
}
