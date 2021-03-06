package com.gamehero.sxd2.gui.theme.ifstheme.container.list {

	import com.gamehero.sxd2.gui.menu.MenuPanel;
	import com.gamehero.sxd2.gui.theme.ifstheme.skin.CommonSkin;
	import com.gamehero.sxd2.gui.theme.ifstheme.skin.GameHintSkin;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	import alternativa.gui.alternativagui;
	import alternativa.gui.container.list.List;
	import alternativa.gui.container.list.ListItemContainer;
	import alternativa.gui.theme.defaulttheme.skin.NumericConst;
	
	import org.bytearray.display.ScaleBitmap;

	use namespace alternativagui;
	
	
	/**
	 * 自定义List 
	 * @author Trey
	 * @create-date 2013-9-3
	 */
	public class MenuList extends alternativa.gui.container.list.List {

		public function MenuList() {
			
			super();
			
			// RU: задаем фон листа
			// EN: set the list background
//			background = new WhiteBG();
			var bg:ScaleBitmap = new ScaleBitmap(CommonSkin.MENU_BG);
			bg.scale9Grid = CommonSkin.MENU_BG_GRID;
			background = bg;
			
			
			// RU: внутренний отступ
            // EN: padding
//			_padding = NumericConst.basePadding;
			_padding = MenuPanel.PADDING;

			// RU: зазор между элементами
            // EN: distance between the elements
//			_space = NumericConst.basePadding;
			_space = 0;
			
			// RU: зазор между контентом и скроллбар.
			// EN: distance between content and scrollbar
			_scrollBarSpace = NumericConst.basePadding;
			
			// RU: задаем контейнер элементов для List
            // EN: List items container
			container = new ListItemContainer();
			
			// RU: задаем scrollBar
            // EN: set the Scrollbar
//			scrollBar = new ScrollBar();
		}
		
		
		// RU: задаем визуальный класс элемента
        // EN: visual class of the item
		override public function set itemRenderer(value:Class):void {
			
			// RU: передаем его контейнеру элементов
            // EN: send it to items container
			container.itemRenderer = value;
			
			
			// RU: задаем количество пикселей для скроллирования колесом мыши
            // EN: number of pixels for scrolling the mouse wheel
//			(scrollBar as ScrollBar).mouseDelta = container.mouseDelta;
			// RU: сколько пикселей в одном шаге - нажатие на кнопку вверх/вниз у scrollBar
            // EN: how many pixels in a single step - click on scroll up / down button
//			(scrollBar as ScrollBar).stepScroll = container.stepScroll;
		}
		
		
		/**
		 * Обновление maxScrollPosition у scrollBar.
		 * 
		 */		
		override protected function updateMaxScrollPosition(e:Event):void {
//			_scrollBar.maxScrollPosition = Math.abs((_container as DisplayObject).height  - _container.contentHeight);
//			_scrollBar.drawChildren();
		}
		
		/**
		 * Обновление scrollPosition у scrollBar.
		 * 
		 */		
		override protected function updateScrollPosition(e:Event):void {
//			_scrollBar.scrollPosition = _container.vertValue;
		}
		
		
		// RU: переписываем метод отрисовки. Позиционируем контейнер элементов и scrollBar
        // EN: override the draw method. Position the items container and the scrollBar
//		override protected function draw():void {
//			
//			super.draw();
			
//			if (_container != null) {
//
//				(_container as DisplayObject).x = (_container as DisplayObject).y = padding;
//
//				(_container as DisplayObject).height = _height - _padding * 2 - NumericConst.borderThickness * 2;
//				
//				if (_scrollBar != null && _scrollBar.visible) {
//					
//					(_container as DisplayObject).width = _width - _padding - _scrollBar.width - _scrollBarSpace;
//				} 
//				else {
//					
//					(_container as DisplayObject).width = _width - _padding * 2;
//				}
//			}
//		}
		
		/**
		 * @inheritDoc 
		 * 
		 */		
		override protected function draw():void {
			super.draw();
			if (_background!=null) {
				_background.x = _background.y = 0;
				_background.width = _width;
				_background.height = _height;
			}
			if (_container!=null) {
				(_container as DisplayObject).x = (_container as DisplayObject).y = _padding;
				(_container as DisplayObject).height = _height - _padding*2;
				if (_scrollBar == null || (_scrollBar != null && !_container.showScrollBar)) {
					(_container as DisplayObject).width = _width ;
				}
			}
		}
		
		// RU: смотрим значение ширины, если меньше заданного, отдаем минимальную ширину
        // EN: if width value is less than the specified value, then return minimal width value
		override protected function calculateWidth(value:int):int {
			
//			if (value < NumericConst.listMinWidth)
//				value = NumericConst.listMinWidth;
			
			return value;
		}
		
	}
}
