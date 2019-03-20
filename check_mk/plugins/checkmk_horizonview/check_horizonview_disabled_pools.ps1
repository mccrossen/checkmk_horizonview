< # 
 
 . S Y N O P S I S 
 	 H o r i z o n   V i e w   D i s a b l e d   p o o l s   C h e c k   ( N a g i o s   C h e c k ) 
 
 . D E S C R I P T I O N 
 	 T h i s   s c r i p t   c a n   b e   u s e d   w i t h   N R P E / N S C l i e n t + +   t o   a l l o w   N a g i o s   t o   m o n i t o r   H o r i z o n   V i e w . 
 
 . E X A M P L E 
 	 . \ c h e c k _ h o r i z o n v i e w _ d i s a b l e d _ p o o l s . p s 1   - S e t P a s s w o r d F i l e P a s s w o r d 
 	 
 	 S a v e   a   p a s s w o r d   t o   a   e n c r y p t e d / h a s h e d   f i l e   ( c a n   b e   u s e d   l a t e r   w i t h   t h e   - P a s s w o r d F i l e P a t h   s w i t c h ) 
 
 . E X A M P L E 
 	 . \ c h e c k _ h o r i z o n v i e w _ d i s a b l e d _ p o o l s . p s 1   - C o n n e c t i o n S e r v e r   h o r i z o n v i e w . e x a m p l e . c o m   - U s e r N a m e   m o n i t o r   - D o m a i n   e x a m p l e . c o m   - P a s s w o r d   s e c r e t 1 
 	 
 	 C o n n e c t   t o   H o r i z o n   V i e w   u s i n g   a   p a s s w o r d 
 
 . E X A M P L E 
 	 . \ c h e c k _ h o r i z o n v i e w _ d i s a b l e d _ p o o l s . p s 1   - C o n n e c t i o n S e r v e r   h o r i z o n v i e w . e x a m p l e . c o m   - U s e r N a m e   m o n i t o r   - D o m a i n   e x a m p l e . c o m   - P a s s w o r d F i l e P a t h   c : \ p a s s w o r d . t x t 
 	 
 	 C o n n e c t   t o   H o r i z o n   V i e w   u s i n g   a   p a s s w o r d   f i l e 
 
 . N O T E S 
 	 N a m e :                 H o r i z o n   V i e w   D i s a b l e d   P o o l s   C h e c k   ( N a g i o s   C h e c k ) 
 	 V e r s i o n :           0 . 2 
 	 A u t h o r :             T h o m a s   C h u b b 
 	 D a t e :                 1 6 / 1 1 / 2 0 1 7 
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
 #   C l e a r   h o s t 
 C l e a r - H o s t 
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
 	 W r i t e - H o s t   ' 3   H V D i s a b l e d P o o l s   -   U N K N O W N :   E r r o r   l o a d i n g   t h e   h o r i z o n   v i e w   m o d u l e s ' 
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
 	 W r i t e - H o s t   " 3   H V D i s a b l e d P o o l s   -   U N K N O W N :   E r r o r   l o a d i n g   c r e d e n t i a l s   u s i n g   t h e   $ P a s s w o r d T y p e " 
 	 E x i t   3 
 } 
 
 #   C o n n e c t   t o   h o r i z o n 
 t r y   { 
 	 C o n n e c t - H V S e r v e r   - S e r v e r   $ C o n n e c t i o n S e r v e r   - D o m a i n   $ U s e r D o m a i n   - C r e d e n t i a l   $ C r e d e n t i a l s   - E r r o r A c t i o n   S t o p   |   O u t - N u l l 
 }   c a t c h   { 
 	 #   U N K N O W N 
 	 W r i t e - H o s t   " 3   H V D i s a b l e d P o o l s   -   U N K N O W N :   E r r o r   c o n n e c t i n g   t o   $ C o n n e c t i o n S e r v e r " 
 	 E x i t   3 
 } 
 
 #   G e t   p o o l   i n f o r m a t i o n 
 $ P o o l S u m m a r y   =   G e t - H V P o o l S u m m a r y   |   S e l e c t   - E x p a n d   D e s k t o p S u m m a r y D a t a   |   S e l e c t   N a m e , D i s p l a y N a m e , E n a b l e d , P r o v i s i o n i n g E n a b l e d 
 $ D i s a b l e d P o o l s   =   $ P o o l S u m m a r y   |   w h e r e   { $ _ . E n a b l e d   - n e   ' F a l s e '   - o r   $ _ . P r o v i s i o n i n g E n a b l e d   - n e   ' F a l s e ' } 
 
 #   R e t u r n   n a g i o s   r e s u l t 
 i f   ( $ D i s a b l e d P o o l s )   { 
 	 #   C R I T I C A L 
 	 $ D i s a b l e d P o o l s S t r i n g   =   ' ' 
 	 $ D i s a b l e d P o o l s   |   f o r e a c h   { $ D i s a b l e d P o o l s S t r i n g   + =   $ _ . N a m e   +   ' , ' } 
 	 $ D i s a b l e d P o o l s S t r i n g   =   $ D i s a b l e d P o o l s S t r i n g . T r i m E n d ( ' , ' ) 
 	 W r i t e - H o s t   " 2   H V D i s a b l e d P o o l s   -   C R I T I C A L : -   D i s a b l e d   p o o l s :   $ D i s a b l e d P o o l s S t r i n g " 
 	 E x i t   2 
 }   e l s e   { 
 	 #   O K 
 	 W r i t e - H o s t   " 0   H V D i s a b l e d P o o l s   -   O K :   A l l   p o o l s   a r e   e n a b l e d " 
 	 E x i t   0 
 } 