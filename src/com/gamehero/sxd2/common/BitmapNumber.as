package com.gamehero.sxd2.common
{
	import com.gamehero.sxd2.gui.theme.ifstheme.skin.NumberSkin;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	
	
	/**
	 * 位图数字
	 * @author xuwenyi
	 * @create 2013-08-20
	 **/
	public class BitmapNumber extends Sprite
	{		
		// 类别
		public static const M_YELLOW:String = "M_YELLOW";	// 普通黄色
		
		public static const BATTLE_B_YELLOW:String = "BATTLE_B_YELLOW";	// 战斗黄色数字（大）
		public static const BATTLE_B_PURPLE:String = "BATTLE_B_PURPLE";	// 战斗紫色数字（大）
		public static const BATTLE_S_RED:String = "BATTLE_S_RED";		// 战斗红色数字（小）
		public static const BATTLE_S_PURPLE:String = "BATTLE_S_PURPLE";	// 战斗紫色数字（小）
		public static const BATTLE_S_GREEN:String = "BATTLE_S_GREEN";	// 战斗绿色数字（小）
		
		public static const WINDOW_S_YELLOW:String = "WINDOW_S_YELLOW";	// 面板黄色数字（小）
		public static const WINDOW_S_BLUE:String = "WINDOW_S_BLUE";	//声望线面板用
		
		public static const FATE_S_YELLOW:String = "FATE_S_YELLOW";	//命途黄色字
		public static const FATE_S_GREEN:String = "FATE_S_GREEN";	//命途绿色字
		public static const FATE_S_BIUE:String = "FATE_S_BIUE";	//命途蓝色字
		public static const FATE_S_GRSY:String = "FATE_S_GRSY";	//命途灰色字
		
		public static const SIX_DESTINIES_WHITE:String = "SIX_DESTINIES_WHITE";//六道轮回白色字
		public static const SIX_DESTINIES_BLACK:String = "SIX_DESTINIES_BLACK";//六道轮回黑色字
		/**
		 * 黄色小字8*10 
		 */		
		public static var Small_YELLOW:String = "Small_YELLOW";//黄色小字8*10
		public static var TIPS_BLUE:String = "TIPS_BLUE";//Tips上的蓝色小字
		
		public static var WROLDBOSS:String = "wroldBoss";//世界Boss
		
		// 数字图片数组
		private static var ICONS:Dictionary = new Dictionary();
		
		// 数字类型
		protected var _type:String;
		// 非数字icon
		private var _icon:String;
		// 显示的数字
		private var _number:int;
		
		// 缩进
		public var indentX:Number = 0;	
		// 单个数字比例
		public var numScale:Number = 1;//用于缩放尺寸较大的数字
		
		
		
		/**
		 * 构造函数
		 * */
		public function BitmapNumber(type:String = BATTLE_S_RED , icon:String = "")
		{
			this.mouseChildren = this.mouseEnabled = false;
			
			_type = type;
			_icon = icon;
			
			if(ICONS[type] == null)
			{
				initIcons(type);
			}
		}
		
		
		
		
		
		
		/**
		 * 更新数字样式
		 * */
		public function update(type:String , str:String, icon:String=""):void
		{
			// 若此素材还未初始化,先初始化
			if(ICONS[type] == null)
			{
				initIcons(type);
			}
			
			_type = type;
			_icon = icon;
			
			// 显示数字
			this.updateNumIcon(str);
		}
		
		
		
		
		
		/**
		 * 时间格式的显示方式 
		 */		
		public function update2(type:String , num:int, icon:String=""):void
		{
			// 若此素材还未初始化,先初始化
			if(ICONS[type] == null)
			{
				initIcons(type);
			}
			
			_type = type;
			_icon = icon;
			
			_number = num;
			
			if(_number >= 10)
			{
				// 显示数字
				this.updateNumIcon(num.toString());
			}
			else
			{
				// 显示数字
				this.updateNumIcon("0" + num.toString());
			}
			
		}
		
		
		/**
		 * 初始化数字图片
		 * */
		private static function initIcons(type:String):void
		{
			ICONS[type] = new Array();
			switch(type)
			{	
				// 普通黄色
				case M_YELLOW:
					ICONS[type][0] = NumberSkin.M_YELLOW_0;
					ICONS[type][1] = NumberSkin.M_YELLOW_1;
					ICONS[type][2] = NumberSkin.M_YELLOW_2;
					ICONS[type][3] = NumberSkin.M_YELLOW_3;
					ICONS[type][4] = NumberSkin.M_YELLOW_4;
					ICONS[type][5] = NumberSkin.M_YELLOW_5;
					ICONS[type][6] = NumberSkin.M_YELLOW_6;
					ICONS[type][7] = NumberSkin.M_YELLOW_7;
					ICONS[type][8] = NumberSkin.M_YELLOW_8;
					ICONS[type][9] = NumberSkin.M_YELLOW_9;
				
				// 战斗黄色大数字
				case BATTLE_B_YELLOW:
					ICONS[type][0] = NumberSkin.B_YELLOW_0;
					ICONS[type][1] = NumberSkin.B_YELLOW_1;
					ICONS[type][2] = NumberSkin.B_YELLOW_2;
					ICONS[type][3] = NumberSkin.B_YELLOW_3;
					ICONS[type][4] = NumberSkin.B_YELLOW_4;
					ICONS[type][5] = NumberSkin.B_YELLOW_5;
					ICONS[type][6] = NumberSkin.B_YELLOW_6;
					ICONS[type][7] = NumberSkin.B_YELLOW_7;
					ICONS[type][8] = NumberSkin.B_YELLOW_8;
					ICONS[type][9] = NumberSkin.B_YELLOW_9;
					break;
				
				// 战斗紫色大数字
				case BATTLE_B_PURPLE:
					ICONS[type][0] = NumberSkin.B_PURPLE_0;
					ICONS[type][1] = NumberSkin.B_PURPLE_1;
					ICONS[type][2] = NumberSkin.B_PURPLE_2;
					ICONS[type][3] = NumberSkin.B_PURPLE_3;
					ICONS[type][4] = NumberSkin.B_PURPLE_4;
					ICONS[type][5] = NumberSkin.B_PURPLE_5;
					ICONS[type][6] = NumberSkin.B_PURPLE_6;
					ICONS[type][7] = NumberSkin.B_PURPLE_7;
					ICONS[type][8] = NumberSkin.B_PURPLE_8;
					ICONS[type][9] = NumberSkin.B_PURPLE_9;
					break;
				
				// 战斗红色小数字
				case BATTLE_S_RED:
					ICONS[type][0] = NumberSkin.S_RED_0;
					ICONS[type][1] = NumberSkin.S_RED_1;
					ICONS[type][2] = NumberSkin.S_RED_2;
					ICONS[type][3] = NumberSkin.S_RED_3;
					ICONS[type][4] = NumberSkin.S_RED_4;
					ICONS[type][5] = NumberSkin.S_RED_5;
					ICONS[type][6] = NumberSkin.S_RED_6;
					ICONS[type][7] = NumberSkin.S_RED_7;
					ICONS[type][8] = NumberSkin.S_RED_8;
					ICONS[type][9] = NumberSkin.S_RED_9;
					ICONS[type]["-"] =  NumberSkin.S_RED_MINUS;
					break;
				
				// 战斗紫色小数字
				case BATTLE_S_PURPLE:
					ICONS[type][0] = NumberSkin.S_PURPLE_0;
					ICONS[type][1] = NumberSkin.S_PURPLE_1;
					ICONS[type][2] = NumberSkin.S_PURPLE_2;
					ICONS[type][3] = NumberSkin.S_PURPLE_3;
					ICONS[type][4] = NumberSkin.S_PURPLE_4;
					ICONS[type][5] = NumberSkin.S_PURPLE_5;
					ICONS[type][6] = NumberSkin.S_PURPLE_6;
					ICONS[type][7] = NumberSkin.S_PURPLE_7;
					ICONS[type][8] = NumberSkin.S_PURPLE_8;
					ICONS[type][9] = NumberSkin.S_PURPLE_9;
					ICONS[type]["-"] =  NumberSkin.S_PURPLE_MINUS;
					break;
				
				// 战斗绿色数字
				case BATTLE_S_GREEN:
					ICONS[type][0] = NumberSkin.S_GREEN_0;
					ICONS[type][1] = NumberSkin.S_GREEN_1;
					ICONS[type][2] = NumberSkin.S_GREEN_2;
					ICONS[type][3] = NumberSkin.S_GREEN_3;
					ICONS[type][4] = NumberSkin.S_GREEN_4;
					ICONS[type][5] = NumberSkin.S_GREEN_5;
					ICONS[type][6] = NumberSkin.S_GREEN_6;
					ICONS[type][7] = NumberSkin.S_GREEN_7;
					ICONS[type][8] = NumberSkin.S_GREEN_8;
					ICONS[type][9] = NumberSkin.S_GREEN_9;
					//ICONS[BT]["+"] =  NumberSkin.BigPlus;
					break;
				
				// 面板黄色数字
				case WINDOW_S_YELLOW:
					ICONS[type][0] = NumberSkin.W_YELLOW_0;
					ICONS[type][1] = NumberSkin.W_YELLOW_1;
					ICONS[type][2] = NumberSkin.W_YELLOW_2;
					ICONS[type][3] = NumberSkin.W_YELLOW_3;
					ICONS[type][4] = NumberSkin.W_YELLOW_4;
					ICONS[type][5] = NumberSkin.W_YELLOW_5;
					ICONS[type][6] = NumberSkin.W_YELLOW_6;
					ICONS[type][7] = NumberSkin.W_YELLOW_7;
					ICONS[type][8] = NumberSkin.W_YELLOW_8;
					ICONS[type][9] = NumberSkin.W_YELLOW_9;
					break;
				case WINDOW_S_BLUE:
					ICONS[type][0] = NumberSkin.W_BLUE_0;
					ICONS[type][1] = NumberSkin.W_BLUE_1;
					ICONS[type][2] = NumberSkin.W_BLUE_2;
					ICONS[type][3] = NumberSkin.W_BLUE_3;
					ICONS[type][4] = NumberSkin.W_BLUE_4;
					ICONS[type][5] = NumberSkin.W_BLUE_5;
					ICONS[type][6] = NumberSkin.W_BLUE_6;
					ICONS[type][7] = NumberSkin.W_BLUE_7;
					ICONS[type][8] = NumberSkin.W_BLUE_8;
					ICONS[type][9] = NumberSkin.W_BLUE_9;
					break;
				case FATE_S_BIUE:
					ICONS[type][0] = NumberSkin.S_BIUE_0;
					ICONS[type][1] = NumberSkin.S_BIUE_1;
					ICONS[type][2] = NumberSkin.S_BIUE_2;
					ICONS[type][3] = NumberSkin.S_BIUE_3;
					ICONS[type][4] = NumberSkin.S_BIUE_4;
					ICONS[type][5] = NumberSkin.S_BIUE_5;
					ICONS[type][6] = NumberSkin.S_BIUE_6;
					ICONS[type][7] = NumberSkin.S_BIUE_7;
					ICONS[type][8] = NumberSkin.S_BIUE_8;
					ICONS[type][9] = NumberSkin.S_BIUE_9;
					break;
				case FATE_S_GREEN:
					ICONS[type][0] = NumberSkin.FATE_S_GREEN_0;
					ICONS[type][1] = NumberSkin.FATE_S_GREEN_1;
					ICONS[type][2] = NumberSkin.FATE_S_GREEN_2;
					ICONS[type][3] = NumberSkin.FATE_S_GREEN_3;
					ICONS[type][4] = NumberSkin.FATE_S_GREEN_4;
					ICONS[type][5] = NumberSkin.FATE_S_GREEN_5;
					ICONS[type][6] = NumberSkin.FATE_S_GREEN_6;
					ICONS[type][7] = NumberSkin.FATE_S_GREEN_7;
					ICONS[type][8] = NumberSkin.FATE_S_GREEN_8;
					ICONS[type][9] = NumberSkin.FATE_S_GREEN_9;
					break;
				case FATE_S_GRSY:
					ICONS[type][0] = NumberSkin.S_GRSY_0;
					ICONS[type][1] = NumberSkin.S_GRSY_1;
					ICONS[type][2] = NumberSkin.S_GRSY_2;
					ICONS[type][3] = NumberSkin.S_GRSY_3;
					ICONS[type][4] = NumberSkin.S_GRSY_4;
					ICONS[type][5] = NumberSkin.S_GRSY_5;
					ICONS[type][6] = NumberSkin.S_GRSY_6;
					ICONS[type][7] = NumberSkin.S_GRSY_7;
					ICONS[type][8] = NumberSkin.S_GRSY_8;
					ICONS[type][9] = NumberSkin.S_GRSY_9;
					break;
				case FATE_S_YELLOW:
					ICONS[type][0] = NumberSkin.S_YELLOW_0;
					ICONS[type][1] = NumberSkin.S_YELLOW_1;
					ICONS[type][2] = NumberSkin.S_YELLOW_2;
					ICONS[type][3] = NumberSkin.S_YELLOW_3;
					ICONS[type][4] = NumberSkin.S_YELLOW_4;
					ICONS[type][5] = NumberSkin.S_YELLOW_5;
					ICONS[type][6] = NumberSkin.S_YELLOW_6;
					ICONS[type][7] = NumberSkin.S_YELLOW_7;
					ICONS[type][8] = NumberSkin.S_YELLOW_8;
					ICONS[type][9] = NumberSkin.S_YELLOW_9;
					break;
				case Small_YELLOW:
					ICONS[type][0] = NumberSkin.Small_YELLOW_0;
					ICONS[type][1] = NumberSkin.Small_YELLOW_1;
					ICONS[type][2] = NumberSkin.Small_YELLOW_2;
					ICONS[type][3] = NumberSkin.Small_YELLOW_3;
					ICONS[type][4] = NumberSkin.Small_YELLOW_4;
					ICONS[type][5] = NumberSkin.Small_YELLOW_5;
					ICONS[type][6] = NumberSkin.Small_YELLOW_6;
					ICONS[type][7] = NumberSkin.Small_YELLOW_7;
					ICONS[type][8] = NumberSkin.Small_YELLOW_8;
					ICONS[type][9] = NumberSkin.Small_YELLOW_9;
					ICONS[type]["+"] =  NumberSkin.Small_YELLOW_Plus;
					ICONS[type][","] =  NumberSkin.Small_YELLOW_COMMA;
					break;
				case SIX_DESTINIES_BLACK:
					ICONS[type][0] = NumberSkin.S_BLACK_0;
					ICONS[type][1] = NumberSkin.S_BLACK_1;
					ICONS[type][2] = NumberSkin.S_BLACK_2;
					ICONS[type][3] = NumberSkin.S_BLACK_3;
					ICONS[type][4] = NumberSkin.S_BLACK_4;
					ICONS[type][5] = NumberSkin.S_BLACK_5;
					ICONS[type][6] = NumberSkin.S_BLACK_6;
					ICONS[type][7] = NumberSkin.S_BLACK_7;
					ICONS[type][8] = NumberSkin.S_BLACK_8;
					ICONS[type][9] = NumberSkin.S_BLACK_9;
					break;
				case SIX_DESTINIES_WHITE:
					ICONS[type][0] = NumberSkin.S_WHITE_0;
					ICONS[type][1] = NumberSkin.S_WHITE_1;
					ICONS[type][2] = NumberSkin.S_WHITE_2;
					ICONS[type][3] = NumberSkin.S_WHITE_3;
					ICONS[type][4] = NumberSkin.S_WHITE_4;
					ICONS[type][5] = NumberSkin.S_WHITE_5;
					ICONS[type][6] = NumberSkin.S_WHITE_6;
					ICONS[type][7] = NumberSkin.S_WHITE_7;
					ICONS[type][8] = NumberSkin.S_WHITE_8;
					ICONS[type][9] = NumberSkin.S_WHITE_9;
					break;
				case TIPS_BLUE:
					ICONS[type][0] = NumberSkin.P_BLUE_0;
					ICONS[type][1] = NumberSkin.P_BLUE_1;
					ICONS[type][2] = NumberSkin.P_BLUE_2;
					ICONS[type][3] = NumberSkin.P_BLUE_3;
					ICONS[type][4] = NumberSkin.P_BLUE_4;
					ICONS[type][5] = NumberSkin.P_BLUE_5;
					ICONS[type][6] = NumberSkin.P_BLUE_6;
					ICONS[type][7] = NumberSkin.P_BLUE_7;
					ICONS[type][8] = NumberSkin.P_BLUE_8;
					ICONS[type][9] = NumberSkin.P_BLUE_9;
					ICONS[type]["."] =  NumberSkin.P_BLUE_P;
					break;
				case WROLDBOSS:
					ICONS[type][0] = NumberSkin.WORLDBOSS_0;
					ICONS[type][1] = NumberSkin.WORLDBOSS_1;
					ICONS[type][2] = NumberSkin.WORLDBOSS_2;
					ICONS[type][3] = NumberSkin.WORLDBOSS_3;
					ICONS[type][4] = NumberSkin.WORLDBOSS_4;
					ICONS[type][5] = NumberSkin.WORLDBOSS_5;
					ICONS[type][6] = NumberSkin.WORLDBOSS_6;
					ICONS[type][7] = NumberSkin.WORLDBOSS_7;
					ICONS[type][8] = NumberSkin.WORLDBOSS_8;
					ICONS[type][9] = NumberSkin.WORLDBOSS_9;
					break;
			}
		}
		
		
		
		
		
		
		/**
		 * 更新数字
		 * @param value
		 * 
		 */		
		private function updateNumIcon(str:String):void
		{
			this.clear();
			
			var bitmap:Bitmap;
			var bmd:BitmapData;
			
			//面板缩进不影响战斗飘字
			switch(_type)
			{
				case WINDOW_S_YELLOW:
				{
					indentX = 5;
					break;
				}
				case TIPS_BLUE:
				{
					indentX = 8;
					break;
				}
				case WROLDBOSS:
				{
					indentX = 5;
					break;
				}
				default:
				{
					break;
				}
			}
			
			if(_icon && _icon != "")
			{
				bmd = ICONS[_type][_icon];
				bitmap = new Bitmap(bmd);
				bitmap.x=- bitmap.width;
				this.addChild(bitmap);
			}
			
			var char:String;
			var preWidth:int = 0;
			for(var i:int=0;i<str.length;i++)
			{
				char = str.charAt(i);
				bmd = ICONS[_type][char];
				bitmap = new Bitmap(bmd);
				if(numScale != 1)
				{
					bitmap.scaleX = bitmap.scaleY = numScale;
				}
				
				// 排列
				bitmap.x = preWidth;
				preWidth += bitmap.width - indentX;
				
				this.addChild(bitmap);
			}
		}
		
		
		
		
		
		public function get number():int
		{
			return _number;
		}
		
		
		
		
		
		/**
		 * 清空
		 * */
		public function clear():void
		{
			while(this.numChildren > 0)
			{
				this.removeChildAt(0);
			}
		}

		
	}
}