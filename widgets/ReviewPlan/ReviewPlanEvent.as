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
package widgets.ReviewPlan
{
	import flash.events.Event;

	public class ReviewPlanEvent extends Event
	{
		public var dataObject:Object;

		//when plan is selected from the result list
		public static var PLAN_SELECTED:String  = "planSelected";

		//when selected plan is loaded on the map
		public static var PLAN_LOADED:String = "planLoaded";

		public function ReviewPlanEvent(type:String,ob:Object=null)
		{
			super(type);
			dataObject = ob;
		}

		public override function clone():Event
		{
			return new ReviewPlanEvent(type,dataObject)
		}
	}
}