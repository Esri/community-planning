/*
 | Version 10.1.1
 | Copyright 2012 Esri
 |
 | Licensed under the Apache License, Version 2.0 (the "License");
 | you may not use this file except in compliance with the License.
 | You may obtain a copy of the License at
 |
 |    http://www.apache.org/licenses/LICENSE-2.0
 |
 | Unless required by applicable law or agreed to in writing, software
 | distributed under the License is distributed on an "AS IS" BASIS,
 | WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 | See the License for the specific language governing permissions and
 | limitations under the License.
 */
package widgets.CommunityPlanning
{
	import com.esri.ags.layers.GraphicsLayer;
	import com.esri.viewer.AppEvent;
	import com.esri.viewer.ViewerContainer;
	import com.esri.viewer.WidgetTemplate;

	import flash.events.MouseEvent;

	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.events.CloseEvent;

	public class ExtendedWidgetTemplate extends WidgetTemplate
	{

		public function ExtendedWidgetTemplate()
		{
			super();
		}

		/**
		 *
		 * On clicking close button if graphicslayer contains any unsaved graphics
		 * user is asked if he wants to clear all unsaved data
		 */
		override protected function close_clickHandler(event:MouseEvent):void
		{
			if((((this.parent as CommunityPlanningWidget).map.getLayer("communityPlanningGraphicsLayer") as GraphicsLayer).graphicProvider as ArrayCollection).length > 0)
			{
				Alert.show("Are you sure you want to close without saving?\nAll the unsaved features will be cleared.","Confirm",(Alert.YES|Alert.NO),null,confirmHandler);
			}
			else
			{
				super.widgetState = "closed";

				var data:Object =
					{
						id: super.widgetId,
							state: super.widgetState
					};
				AppEvent.dispatch(AppEvent.WIDGET_STATE_CHANGED, data);
			}
		}

		/**
		 *
		 * If user selects yes, graphicslayer is cleared and widget is closed
		 */
		private function confirmHandler(event:CloseEvent):void
		{
			if(event.detail == Alert.YES)
			{
				((this.parent as CommunityPlanningWidget).map.getLayer("communityPlanningGraphicsLayer") as GraphicsLayer).clear();
				super.widgetState = "closed";

				var data:Object =
					{
						id: super.widgetId,
						state: super.widgetState
					};
				AppEvent.dispatch(AppEvent.WIDGET_STATE_CHANGED, data);
			}
		}
	}
}