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
