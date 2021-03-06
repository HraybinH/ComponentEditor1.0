package src.wyy.view
{
	
	import flash.events.MouseEvent;
	import mx.controls.Button;
	
	import spark.components.Group;
	
	import src.wyy.event.WyyEvent;
	import src.wyy.model.CompModel;
	import src.wyy.vo.PropertyBaseVo;
	
	/**
	 * 组件展示部分
	 * @author weiyanyu
	 * 创建时间：2016-9-22 下午3:54:36
	 */
	public class ComponentView extends Group
	{
		public function ComponentView()
		{
			super();
			
			var vo:PropertyBaseVo;
			var arr:Array = CompModel.inst.compArr;
			for (var i:int = 0; i < arr.length; i++)
			{
				vo = arr[i];
				var btn:Button = new Button();
				btn.x = 10;
				btn.y = 20 + (20 + 5) * i;
				addElement(btn);
				btn.data = vo;
				btn.label = vo.type;
				btn.addEventListener(MouseEvent.MOUSE_DOWN,onStartDrag);
			}
			
		}
		
		protected function onStartDrag(event:MouseEvent):void
		{
			var btn:Button = event.target as Button;
			dispatchEvent(new WyyEvent(WyyEvent.DRAG_COMPONENT,btn.data.clone));
		}
	}
}