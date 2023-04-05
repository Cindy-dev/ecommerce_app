import 'package:flutter/material.dart';
import 'package:flutter_app_ui/e-commerce_app/data/models/product.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';

import '../blocs/cart_bloc/cart_bloc.dart';
import '../cubits/cart_item_cubit.dart';
import '../cubits/cart_item_state.dart';
import '../providers/cart_provider.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SizedBox(
              height: 24,
            ),
            Center(
              child: Text(
                'Your Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 14,
            ),
            Expanded(
              child: CartListWidget(),
            )
          ],
        ),
      ),
    );
  }
}

class CartListWidget extends StatefulWidget {
  const CartListWidget({super.key});

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

/// This is the state of the _CartListWidget widget.
/// It holds a list of [Shoe] items and a [GlobalKey] for the
/// [AnimatedList] widget.
class _CartListWidgetState extends State<CartListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<Product> _items = [];

  @override
  Widget build(BuildContext context) {
    return Nested(
      // Nest this widget in the [CartPage] widget
      children: [
        BlocListener<CartBloc, CartState>(
          // Listen to changes in the [CartBloc] state
          listener: (context, state) {
            if (state is CartItemAdded) {
              // If a new item has been added to the cart
              _addItem(state.product); // Add the new item to the [_items] list
              context.read<CartProvider>().updateCartItems(
                    _items,
                  ); // Update the cart items in the [CartProvider]
              context
                  .read<CartBloc>()
                  .add(ResetCartBlocEvent()); // Reset the [CartBloc] state
            } else if (state is CartItemRemoved) {
              // If an item has been removed from the cart
              context.read<CartProvider>().updateCartItems(
                    _items,
                  ); // Update the cart items in the [CartProvider]
              context
                  .read<CartBloc>()
                  .add(ResetCartBlocEvent()); // Reset the [CartBloc] state
            } else if (state is CartInitial) {}
          },
        )
      ],
      child: ScrollConfiguration(
        // Configure scrolling behavior of the [AnimatedList]
        behavior: ScrollConfiguration.of(context).copyWith(
          scrollbars: false, // Hide the scrollbar
        ),
        child: AnimatedList(
          // The list of [CartItemWidget]s in the cart
          key: _listKey,
          initialItemCount: _items.length,
          itemBuilder: (context, index, animation) {
            return CartItemWidget(
              // Return a [CartItemWidget] for each item in [_items]
              _items[index],
              animation,
              onRemoveItem: () => _removeItem(
                _items[index],
              ), // When the remove button is pressed, remove the item from
              // the cart
            );
          },
        ),
      ),
    );
  }

  /// This method adds a [Shoe] item to the [_items] list and inserts a new [
  /// CartItemWidget] into the [AnimatedList].
  void _addItem(Product product) {
    final index = _items.length;
    _items.add(product);
    _listKey.currentState!.insertItem(index);
  }

  /// This method removes a [Shoe] item from the [_items] list and removes the
  /// corresponding [CartItemWidget] from the [AnimatedList].
  void _removeItem(Product product) {
    final index = _items.indexOf(product);
    _items.removeAt(index);
    context.read<CartBloc>().add(
          RemoveItemFromCartEvent(
            product: product,
          ),
        ); // Remove the item from the cart in the [CartBloc]
    _listKey.currentState!.removeItem(
      // Remove the [CartItemWidget] from the [AnimatedList]
      index,
      (context, animation) {
        return CartItemWidget(product, animation);
      },
    );
  }
}

class CartItemWidget extends StatefulWidget {
  const CartItemWidget(
    this.product,
    this.animation, {
    super.key,
    this.onRemoveItem,
  });
  final Product product;
  final Animation<double> animation;
  final VoidCallback? onRemoveItem;

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget>
    with TickerProviderStateMixin {
  late CartItemCubit _cartItemCubit;
  late AnimationController _controller;
  late AnimationController _controller1;
  late AnimationController _controller2;

  late Animation<double> _animation;
  late Animation<double> _animation1;
  late Animation<Offset> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    // Initialize the CartItemCubit to increment cart item count
    _cartItemCubit = CartItemCubit()..incrementCartItem();
    print(_cartItemCubit.toString());

    // Create animation controllers with durations of 400ms,
    // 100ms and 200ms respectively
    _controller = _createAnimationController(400);
    _controller1 = _createAnimationController(100);
    _controller2 = _createAnimationController(200);

    // Create animations using Tween with specific begin and end values
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _animation1 = Tween<double>(begin: 0, end: 1).animate(_controller1);
    _animation2 = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(_controller2);
    _animation3 = Tween<double>(begin: 0, end: 1).animate(_controller2);

    // Initialize and start animations
    _initAnimations();
  }

  // Function to create AnimationControllers
  AnimationController _createAnimationController(int milliseconds) {
    return AnimationController(
      vsync: this,
      duration: Duration(milliseconds: milliseconds),
    );
  }

  // Function to initialize and start animations
  void _initAnimations() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _controller1.forward();
    });
    Future.delayed(const Duration(milliseconds: 400), () {
      _controller2.forward();
    });
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose animation controllers to free up resources
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prod = widget.product;
    final animation = widget.animation;
    return ScaleTransition(
      scale: animation,
      alignment: Alignment.centerLeft,
      child: BlocProvider.value(
        value: _cartItemCubit,
        child: Nested(
          children: [
            BlocListener<CartItemCubit, CartItemState>(
              listener: (_, state) {
                if (state is CartItemUpdated &&
                    state.cartItemCount == 0 &&
                    widget.onRemoveItem != null) {
                  widget.onRemoveItem!();
                  return;
                }
              },
            )
          ],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: UnconstrainedBox(
                          child: ScaleTransition(
                            scale: _animation,
                            child: const CircleAvatar(
                              backgroundColor: Colors.orange,
                              radius: 30,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,
                          // child: Transform.rotate(
                          //   angle: 30,
                          //   child: ScaleTransition(
                          //     scale: _animation1,
                              child:
                              Image.asset(
                                prod.image,
                              ),
                            ),
                          ),
                       // ),
                     // ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SlideTransition(
                          position: _animation2,
                          child: FadeTransition(
                            opacity: _animation3,
                            child: Text(
                              prod.name,
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SlideTransition(
                          position: _animation2,
                          child: FadeTransition(
                            opacity: _animation3,
                            child: Text(
                              '\$${prod.price}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SlideTransition(
                          position: _animation2,
                          child: FadeTransition(
                            opacity: _animation3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _cartItemCubit.decrementCartItem();
                                  },
                                  icon: const Icon(Icons.chevron_left_rounded),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                BlocBuilder<CartItemCubit, CartItemState>(
                                  builder: (context, state) {
                                    return Text(
                                      state is CartItemUpdated
                                          ? state.cartItemCount.toString()
                                          : '',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    );
                                  },
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                IconButton(
                                  onPressed: () {
                                    _cartItemCubit.incrementCartItem();
                                  },
                                  icon: const Icon(
                                    Icons.chevron_right_rounded,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const YMargin(5),
              FadeTransition(
                opacity: _animation3,
                child: const Divider(),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class YMargin extends StatelessWidget {
  const YMargin(
    this.value, {
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class XMargin extends StatelessWidget {
  const XMargin(
    this.value, {
    super.key,
  });
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}
