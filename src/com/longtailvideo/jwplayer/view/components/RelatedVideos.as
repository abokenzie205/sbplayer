package com.longtailvideo.jwplayer.view.components
{
	import com.longtailvideo.jwplayer.events.ViewEvent;
	import com.longtailvideo.jwplayer.media.MediaProvider;
	import com.longtailvideo.jwplayer.utils.AssetLoader;
	import com.longtailvideo.jwplayer.utils.Draw;
	import com.longtailvideo.jwplayer.utils.Logger;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.URLLoader;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	[Event(name="jwplayerViewClick", type="com.longtailvideo.jwplayer.events.ViewEvent")]
	
	
	public class RelatedVideos extends MovieClip
	{
		
		private var _xstep:int = 0;
		private var _ystep:int = 0;
		
		private const hgap:int = 11;
		private const vgap:int = 12;
		
		public function RelatedVideos()
		{
			super();
		}
	
		
		public function init(arr:Array):void{
			
			for(var i:int=0;i<arr.length; i++){
				
				var rv:RelatedVideo = new RelatedVideo();
				rv.init(arr[i]['image'],arr[i]['duration'],arr[i]['title'],arr[i]['url']);
				rv.x = _xstep;
				rv.y = _ystep;
				
				
				
				_xstep = ((i+1) % 3 == 0) ? 0 : _xstep+rv.wid+hgap;
				_ystep = ((i+1) % 3 == 0) ? Math.floor((i+1)/3)*(rv.hei+vgap) : _ystep;
				
				Logger.log(_xstep,"xstep");
				Logger.log(_ystep,"ystep");
				
				this.addChild(rv);
					
			}
			
			this.addEventListener(MouseEvent.CLICK,onClickHandler,true);
		
			
		}
		
		protected function onClickHandler(event:MouseEvent):void
		{
			// TODO Auto-generated method stub
			var tgt = event.target as RelatedVideo;
			event.stopPropagation();
			dispatchEvent(new ViewEvent("jwplayerViewClick",tgt.url));
		}		
		
	}
}