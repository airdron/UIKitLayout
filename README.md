# UIKitLayout

viewWillLayoutSubviews вызывается до layoutSubviews корневой вью, viewDidLayoutSubviews вызывается после layoutSubviews корневой вью. layoutSubviews чилдов вызывается после viewDidLayoutSubviews.

## Начальный лог обновления лейаута, когда вьюхи добавляются в иерархию UIWindow:

viewWillLayoutSubviews()

layoutSubviews() <UIKitLayout.RootView: 0x7f9864e04dc0; frame = (0 0; 667 375); layer = <CALayer: 0x600002086060>>

viewDidLayoutSubviews()

layoutSubviews() <UIKitLayout.ChildOfRootView: 0x7f9864e051c0; frame = (0 0; 667 375); layer = <CALayer: 0x600002086040>>

viewWillLayoutSubviews()

layoutSubviews() <UIKitLayout.RootView: 0x7f9864e04dc0; frame = (0 0; 667 375); layer = <CALayer: 0x600002086060>>

viewDidLayoutSubviews()

layoutSubviews() <UIKitLayout.ChildOfRootView: 0x7f9864e051c0; frame = (0 0; 667 375); layer = <CALayer: 0x600002086040>>

layoutSubviews() <UIKitLayout.ChildOfChildOfRootView: 0x7f9864e05330; frame = (0 0; 667 375); layer = <CALayer: 0x600002086000>>

## Лог обновления лейаута, когда делаем поворот экрана, меняются размеры вьюх, соответсвенно лейаут будет пересчитываться полностью у всего дерева. Отличие от первого примера только в том, что происходит все внутри транзакции и каждой вью присвоена анимация.

viewWillLayoutSubviews()

layoutSubviews() <UIKitLayout.RootView: 0x7fb590204c40; frame = (0 0; 667 375); animations = { bounds.origin=<CABasicAnimation: 0x6000025bef80>; bounds.size=<CABasicAnimation: 0x6000025bf1a0>; position=<CABasicAnimation: 0x6000025bf080>; }; layer = <CALayer: 0x6000025a56a0>>

viewDidLayoutSubviews()

viewWillLayoutSubviews()

layoutSubviews() <UIKitLayout.RootView: 0x7fb590204c40; frame = (0 0; 667 375); animations = { bounds.origin=<CABasicAnimation: 0x6000025bef80>; bounds.size=<CABasicAnimation: 0x6000025bf1a0>; position=<CABasicAnimation: 0x6000025bf080>; }; layer = <CALayer: 0x6000025a56a0>>

viewDidLayoutSubviews()

layoutSubviews() <UIKitLayout.ChildOfRootView: 0x7fb5902062d0; frame = (0 0; 667 375); animations = { position=<CABasicAnimation: 0x6000025bf0c0>; bounds.origin=<CABasicAnimation: 0x6000025bf1e0>; bounds.size=<CABasicAnimation: 0x6000025bf220>; }; layer = <CALayer: 0x6000025a56e0>>

layoutSubviews() <UIKitLayout.ChildOfChildOfRootView: 0x7fb590206440; frame = (0 0; 667 375); animations = { position=<CABasicAnimation: 0x6000025bf420>; bounds.origin=<CABasicAnimation: 0x6000025bf4c0>; bounds.size=<CABasicAnimation: 0x6000025bf4e0>; }; layer = <CALayer: 0x6000025a5780>>

## Когда изменяется layout
https://developer.apple.com/library/archive/documentation/WindowsViews/Conceptual/ViewPG_iPhoneOS/CreatingViews/CreatingViews.html

Adjusting the Size and Position of Views at Runtime

Whenever the size of a view changes, the size and position of its subviews must change accordingly. The UIView class supports both the automatic and manual layout of views in a view hierarchy. With automatic layout, you set the rules that each view should follow when its parent view resizes, and then forget about resizing operations altogether. With manual layout, you manually adjust the size and position of views as needed.

Being Prepared for Layout Changes
Layout changes can occur whenever any of the following events happens in a view:

The size of a view’s bounds rectangle changes.
An interface orientation change occurs, which usually triggers a change in the root view’s bounds rectangle.
The set of Core Animation sublayers associated with the view’s layer changes and requires layout.
Your application forces layout to occur by calling the setNeedsLayout or layoutIfNeeded method of a view.
Your application forces layout by calling the setNeedsLayout method of the view’s underlying layer object.

