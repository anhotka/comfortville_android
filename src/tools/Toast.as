package tools
{
	
	    import flash.events.TimerEvent;
	    import flash.utils.Timer;
	    
	    import spark.components.BorderContainer;
	    import spark.components.Label;
	    import spark.components.View;
	    import spark.layouts.VerticalLayout;
	 
	    public class Toast extends BorderContainer
	    {
			private var active:Boolean = false;
		         /**
		          *  CONSTRUCTER
		          */
			 
			public function Toast(context:View, textToDisplay:String, timeOut:Number = 3000, percentWidth:Number = NaN, percentHeight:Number = NaN, color:String = '#454545', x:Number = NaN, y:Number = NaN):void
		        {
			            super();
				    this.active = true;
			            // TIMER TO 'REMOVE' TOAST AFTER THE SPECIFIED 'TIMEOUT'
			            var timer:Timer = new Timer(timeOut, 1);
			            timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(event:TimerEvent):void{
				                context.removeElementAt(context.numElements - 1);
						this.active = false;
			            });
			            timer.start();
			 
			            createUI(textToDisplay, color, percentWidth, percentHeight);
			 
			            // TOAST POSITION
			            positionToast(context);
						
				
		        }
		 

			public function destroy():void
			{
				if(this.active)
				context.removeElementAt(context.numElements - 1);	
			}

			public function isActive():Boolean
			{
				return this.isActive;
			}

				
		         /**
		          *  CREATE TOAST UI COMPONENTS
		          */
		        private function createUI(textToDisplay:String, color:String, percentWidth:Number, percentHeight:Number):void
		        {
			            selfProperties(color, percentWidth, percentHeight);
			            addText(textToDisplay);
						
		        }
		 
		         /**
		          * ASSIGNING ATTRIBUTES TO THE BASE CONTAINER
		          */
		        private function selfProperties(color:String, percentWidth:Number, percentHeight:Number):void
		        {
			            this.percentWidth=percentWidth;
			            this.percentHeight=percentHeight;
			            this.setStyle('backgroundAlpha','1');
			            this.setStyle('backgroundColor',color);
			            this.setStyle('borderColor','#ff9966');
			            this.setStyle('borderWeight','3');
			            this.setStyle('cornerRadius','7');
						this.setStyle('horizontalCenter', '0');
			 
			            var vl:VerticalLayout = new VerticalLayout();
			            vl.horizontalAlign = "center";
						vl.verticalAlign = "middle";
			            this.layout = vl;
		        }
			
		         /**
		          *  CREATE LABEL
		          */
		        private function addText(textToDisplay:String):void
		        {
			            var lbl:Label = new Label();
			            lbl.setStyle('color','#663366');
			            lbl.setStyle('fontSize','32');
						lbl.setStyle('fontWeight','normal');
			            lbl.text = textToDisplay;
			            lbl.setStyle('textAlign', 'center');
			            lbl.percentWidth = this.percentWidth;
						lbl.percentHeight = this.percentHeight;
						lbl.setStyle('verticalAlign', 'middle');
			 
			            this.addElement(lbl);
		        }
		 
				

				
				
		         /**
		          *  POSITIONING THE TOAST
		          */
		        private function positionToast(context:View):void
		        {
			            // POSITION TOAST
			            if(Number(x) && Number(y))
			            {
				                this.x = x;
				                this.y = y;
			            }
			            else
			            {
				                if(Number(x) && !Number(y))
				                {
					                    throw new Error("Toast : 'Y' attribute also needs to be specified");
				                }
				 
				                this.x = (context.percentWidth / 2) - (this.percentWidth / 2);
				                this.y = (context.percentHeight * 3 / 4) - (this.percentHeight / 2);
			            }
			 
			            // IF PREVIOUSLY ADDED COMPONENT IS A TOAST, RE-ORDER TO MANAGE TIMER
			            if(context.getElementAt(context.numElements - 1) is Toast)
				                context.addElementAt(this, context.numElements - 1);
			            else
				                context.addElement(this);
		        }
	    }
	
}