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
		         /**
		          *  CONSTRUCTER
		          */
			 
			public function Toast(context:View, textToDisplay:String, timeOut:Number = 3000, width:Number = 290, height:Number = 480, color:String = '#454545', x:Number = NaN, y:Number = NaN):void
		        {
			            super();
			 
			            // TIMER TO 'REMOVE' TOAST AFTER THE SPECIFIED 'TIMEOUT'
			            var timer:Timer = new Timer(timeOut, 1);
			            timer.addEventListener(TimerEvent.TIMER_COMPLETE, function(event:TimerEvent):void{
				                context.removeElementAt(context.numElements - 1);
			            });
			            timer.start();
			 
			            createUI(textToDisplay, color, width, height);
			 
			            // TOAST POSITION
			            positionToast(context);
						
						
		        }
		 
			
				
		         /**
		          *  CREATE TOAST UI COMPONENTS
		          */
		        private function createUI(textToDisplay:String, color:String, width:Number, height:Number):void
		        {
			            selfProperties(color, width, height);
			            addText(textToDisplay);
						
		        }
		 
		         /**
		          * ASSIGNING ATTRIBUTES TO THE BASE CONTAINER
		          */
		        private function selfProperties(color:String, width:Number, height:Number):void
		        {
			            this.width=width;
			            this.height=height;
			            this.setStyle('backgroundAlpha','0.75');
			            this.setStyle('backgroundColor',color);
			            this.setStyle('borderColor','#663366');
			            this.setStyle('borderWeight','3');
			            this.setStyle('cornerRadius','7');
			 
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
			            lbl.setStyle('color','#000000');
			            lbl.setStyle('fontSize','24');
						lbl.setStyle('fontWeight','bold');
			            lbl.text = textToDisplay;
			            lbl.setStyle('textAlign', 'center');
			            lbl.width = this.width;
						lbl.height = this.height;
			 
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
				 
				                this.x = (context.width / 2) - (this.width / 2);
				                this.y = (context.height * 3 / 4) - (this.height / 2);
			            }
			 
			            // IF PREVIOUSLY ADDED COMPONENT IS A TOAST, RE-ORDER TO MANAGE TIMER
			            if(context.getElementAt(context.numElements - 1) is Toast)
				                context.addElementAt(this, context.numElements - 1);
			            else
				                context.addElement(this);
		        }
	    }
	
}