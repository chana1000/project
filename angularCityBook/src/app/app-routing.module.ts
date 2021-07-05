import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { InstructionsComponent } from '../app/views/Instructions/instructions/instructions.component';

import { PersonalDetailsComponent } from '../app/views/personal-details/personal-details.component';

const routes: Routes = [

{path:'insructions',component:InstructionsComponent},
{path:'personalDetails',component:PersonalDetailsComponent},
{path:'**',component:InstructionsComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
