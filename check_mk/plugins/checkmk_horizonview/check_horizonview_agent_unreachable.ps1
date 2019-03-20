< # 
 
 . S Y N O P S I S 
 	 H o r i z o n   V i e w   A g e n t   U n r e a c h a b l e   C h e c k   ( N a g i o s   C h e c k ) 
 
 . D E S C R I P T I O N 
 	 T h i s   s c r i p t   c a n   b e   u s e d   w i t h   N R P E / N S C l i e n t + +   t o   a l l o w   N a g i o s   t o   m o n i t o r   H o r i z o n   V i e w   f o r   p r o b l e m   V M   a g e n t s . 
 	 I t   w i l l   r e t u r n   w a r n i n g   w h e n   o n e   m a c h i n e   i s   d e t e c t e d ,   c r i t i c a l   w h e n   m o r e   t h a n   o n e   m a c h i n e   i s   d e t e c t e d . 
 	 
 . E X A M P L E 
 	 . \ c h e c k _ h o r i z o n v i e w _ a g e n t _ u n r e a c h a b l e . p s 1   - S e t P a s s w o r d F i l e P a s s w o r d 
 	 
 	 S a v e   a   p a s s w o r d   t o   a   e n c r y p t e d / h a s h e d   f i l e   ( c a n   b e   u s e d   l a t e r   w i t h   t h e   - P a s s w o r d F i l e P a t h   s w i t c h ) 
 
 . E X A M P L E 
 	 . \ c h e c k _ h o r i z o n v i e w _ a g e n t _ u n r e a c h a b l e . p s 1   - C o n n e c t i o n S e r v e r   h o r i z o n v i e w . e x a m p l e . c o m   - U s e r N a m e   m o n i t o r   - D o m a i n   e x a m p l e . c o m   - P a s s w o r d   s e c r e t 1 
 	 
 	 C o n n e c t   t o   H o r i z o n   V i e w   u s i n g   a   p a s s w o r d 
 
 . E X A M P L E 
 	 . \ c h e c k _ h o r i z o n v i e w _ a g e n t _ u n r e a c h a b l e . p s 1   - C o n n e c t i o n S e r v e r   h o r i z o n v i e w . e x a m p l e . c o m   - U s e r N a m e   m o n i t o r   - D o m a i n   e x a m p l e . c o m   - P a s s w o r d F i l e P a t h   c : \ p a s s w o r d . t x t 
 	 
 	 C o n n e c t   t o   H o r i z o n   V i e w   u s i n g   a   p a s s w o r d   f i l e 
 
 . N O T E S 
 	 N a m e :                 H o r i z o n   V i e w   A g e n t   U n r e a c h a b l e   C h e c k   ( N a g i o s   C h e c k ) 
 	 V e r s i o n :           0 . 8 
 	 A u t h o r :             T h o m a s   C h u b b 
 	 U R L : 	 	   h t t p s : / / g i t h u b . c o m / t s c h u b b / c h e c k _ h o r i z o n v i e w 
 	 D a t e :                 2 4 / 1 0 / 2 0 1 7 
 
 # > 
 
 p a r a m   ( 
 	 [ s t r i n g ] $ C o n n e c t i o n S e r v e r   =   ' h o r i z o n v i e w . e x a m p l e . c o m ' , 
 	 [ s t r i n g ] $ U s e r N a m e   =   ' m o n i t o r i n g ' , 
 	 [ s t r i n g ] $ U s e r D o m a i n   =   ' e x a m p l e . c o m ' , 
 	 [ s t r i n g ] $ P a s s w o r d F i l e P a t h   =   ' C : \ P a s s . t x t ' , 
 	 [ s t r i n g ] $ P a s s w o r d   =   $ n u l l , 
 	 [ s w i t c h ] $ S e t P a s s w o r d F i l e P a s s w o r d   =   $ f a l s e 
 ) 
 
 #   R u n   p a s s w o r d   f i l e   s e t   w i z a r d   i f   t h e   s w i t c h   i s   u s e d 
 i f   ( $ S e t P a s s w o r d F i l e P a s s w o r d )   { 
 	 W r i t e - H o s t   " P a s s w o r d   f i l e   s e t u p   w i z a r d   ( i f   t h e   p a s s w o r d   f i l e   e x i s t s   i t   w i l l   b e   o v e r w r i t t e n ) ` n " 
 	 $ E n t e r e d P a s s w o r d F i l e P a t h   =   R e a d - H o s t   - P r o m p t   ' E n t e r   t h e   p a t h   t o   t h e   p a s s w o r d   f i l e   y o u   w i s h   t o   c r e a t e / o v e r w r i t e ' 
 	 $ E n t e r e d P a s s w o r d   =   R e a d - H o s t   - A s S e c u r e S t r i n g   - P r o m p   ' E n t e r   t h e   p a s s w o r d   t o   b e   s a v e d   i n   t h e   p a s s w o r d   f i l e   ( c o p y   a n d   p a s t e   i s   n o t   s u p p o r t e d ) ' 
 	 t r y   { 
 	 	 $ E n t e r e d P a s s w o r d   |   C o n v e r t F r o m - S e c u r e S t r i n g   - E r r o r A c t i o n   S t o p   |   O u t - F i l e   $ E n t e r e d P a s s w o r d F i l e P a t h   - F o r c e   - E r r o r A c t i o n   S t o p 
 	 }   c a t c h   { 
 	 	 W r i t e - H o s t   " ` n E r r o r   w r i t i n g   p a s s w o r d   f i l e " 
 	 	 E x i t 
 	 } 
 	 W r i t e - H o s t   " ` n P a s s w o r d   f i l e   s a v e d   ( $ E n t e r e d P a s s w o r d F i l e P a t h ) " 
 	 E x i t 
 } 
 
 #   L o a d   r e q u i r e d   m o d u l e s 
 t r y   { 
 	 I m p o r t - M o d u l e   V M w a r e . V i m A u t o m a t i o n . H o r i z o n V i e w   - E r r o r A c t i o n   S t o p 
 	 I m p o r t - M o d u l e   V M w a r e . V i m A u t o m a t i o n . C o r e   - E r r o r A c t i o n   S t o p 
 }   c a t c h   { 
 	 #   U N K N O W N 
 	 W r i t e - H o s t   ' 3   H V U n r e a c h a b l e V M s   -   U N K N O W N :   E r r o r   l o a d i n g   t h e   h o r i z o n   v i e w   m o d u l e s ' 
 	 E x i t   3 
 } 
 
 #   S e t   c r e d e n t i a l s 
 i f   ( $ P a s s w o r d )   { $ P a s s w o r d T y p e   =   ' p a s s w o r d   a r g u m e n t ' }   e l s e   { $ P a s s w o r d T y p e   =   ' p a s s w o r d   f i l e   a r g u m e n t ' } 
 t r y   { 
 	 i f   ( $ P a s s w o r d )   { 
 	 	 #   U s e   t h e   p l a i n   t e x t   p a s s w o r d   a r g u m e n t 
 	 	 $ S e c P a s s w o r d   =   $ P a s s w o r d   |   C o n v e r t T o - S e c u r e S t r i n g   - A s P l a i n T e x t   - F o r c e 
 	 	 $ C r e d e n t i a l s   =   N e w - O b j e c t   - T y p e N a m e   S y s t e m . M a n a g e m e n t . A u t o m a t i o n . P S C r e d e n t i a l   - A r g u m e n t L i s t   $ U s e r N a m e , $ S e c P a s s w o r d 
 	 	 }   e l s e   { 
 	 	 #   U s e   p a s s w o r d   t h e   f i l e   i f   a   p l a i n   t e x t   p a s s w o r d   a r g u m e n t   i s   n o t   p r o v i d e d 
 	 	 $ P a s s w o r d   =   G e t - C o n t e n t   $ P a s s w o r d F i l e P a t h   - E r r o r A c t i o n   S t o p 
 	 	 $ C r e d e n t i a l s   =   N e w - O b j e c t   - T y p e N a m e   S y s t e m . M a n a g e m e n t . A u t o m a t i o n . P S C r e d e n t i a l   - A r g u m e n t L i s t   $ U s e r N a m e , ( $ P a s s w o r d   |   C o n v e r t T o - S e c u r e S t r i n g   - E r r o r A c t i o n   S t o p )   - E r r o r A c t i o n   S t o p 
 	 } 
 }   c a t c h   { 
 	 #   U N K N O W N 
 	 W r i t e - H o s t   " 3   H V U n r e a c h a b l e V M s   -   U N K N O W N :   E r r o r   l o a d i n g   c r e d e n t i a l s   u s i n g   t h e   $ P a s s w o r d T y p e " 
 	 E x i t   3 
 } 
 
 #   C o n n e c t   t o   h o r i z o n 
 t r y   { 
 	 C o n n e c t - H V S e r v e r   - S e r v e r   $ C o n n e c t i o n S e r v e r   - D o m a i n   $ U s e r D o m a i n   - C r e d e n t i a l   $ C r e d e n t i a l s   - E r r o r A c t i o n   S t o p   |   O u t - N u l l 
 }   c a t c h   { 
 	 #   U N K N O W N 
 	 W r i t e - H o s t   " 3   H V U n r e a c h a b l e V M s   -   U N K N O W N :   E r r o r   c o n n e c t i n g   t o   $ C o n n e c t i o n S e r v e r " 
 	 E x i t   3 
 } 
 
 #   G e t   s e s s i o n   i n f o r m a t i o n 
 $ P r o b l e m V M s   =   ( G e t - H V M a c h i n e S u m m a r y ) . B a s e   |   w h e r e   { $ _ . B a s i c S t a t e   - e q   ' A G E N T _ U N R E A C H A B L E ' } 
 
 #   R e t u r n   n a g i o s   r e s u l t 
 i f   ( $ P r o b l e m V M s )   { 
 	 $ P r o b l e m V M s C o u n t   =   0 
 	 $ P r o b l e m V M s   |   f o r e a c h   { $ P r o b l e m V M s C o u n t   + + } 
 }   e l s e   { 
 	 #   O K 
 	 W r i t e - H o s t   " 0   H V U n r e a c h a b l e V M s   P r o b l e m V M s C o u n t = 0   O K :   V M s   i n   a   a g e n t   u n r e a c h a b l e   s t a t e :   0 " 
 	 E x i t   0 
 } 
 
 i f   ( $ P r o b l e m V M s C o u n t   - g t   1 )   { 
 	 #   C r i t i a l   
 	 W r i t e - H o s t   " 2   H V U n r e a c h a b l e V M s   P r o b l e m V M s C o u n t = $ ( $ P r o b l e m V M s C o u n t )   C r i t i a l :   V M s   i n   a   a g e n t   u n r e a c h a b l e   s t a t e :   $ ( $ P r o b l e m V M s C o u n t ) " 
 	 E x i t   2 
 }   e l s e   { 
 	 #   W a r n i n g 
 	 W r i t e - H o s t   " 1   H V U n r e a c h a b l e V M s   P r o b l e m V M s C o u n t = $ ( $ P r o b l e m V M s C o u n t )   W a r n i n g :   V M s   i n   a   a g e n t   u n r e a c h a b l e   s t a t e :   $ ( $ P r o b l e m V M s C o u n t ) " 
 	 E x i t   1 
 } 