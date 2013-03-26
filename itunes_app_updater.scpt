FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
from http://n8henrie.com/2013/03/a-strategy-for-ui-scripting-in-applescript/

Many thanks to those unknowing contributers that share their Applescript on the web. A few that helped with this script include: 
- Most of the UI Scripting came from Yoshimasa Niwa here: https://gist.github.com/4223249
- Code for checking if an app is running came from here: http://codesnippets.joyent.com/posts/show/1124

####n8henrie Sat Mar 16 14:41:41 MDT 2013
* Added several delays that seemed to be responsible for breaking this script in iTunes 11 

####n8henrie Sun Mar 17 09:57:47 MDT 2013
* Added compatibility with iTunes 10 (untested, please confirm if you can)
* Added compatibility with having the iTunes sidebar activated (thanks to mattb in the comments)
     � 	 	� 
 f r o m   h t t p : / / n 8 h e n r i e . c o m / 2 0 1 3 / 0 3 / a - s t r a t e g y - f o r - u i - s c r i p t i n g - i n - a p p l e s c r i p t / 
 
 M a n y   t h a n k s   t o   t h o s e   u n k n o w i n g   c o n t r i b u t e r s   t h a t   s h a r e   t h e i r   A p p l e s c r i p t   o n   t h e   w e b .   A   f e w   t h a t   h e l p e d   w i t h   t h i s   s c r i p t   i n c l u d e :   
 -   M o s t   o f   t h e   U I   S c r i p t i n g   c a m e   f r o m   Y o s h i m a s a   N i w a   h e r e :   h t t p s : / / g i s t . g i t h u b . c o m / 4 2 2 3 2 4 9 
 -   C o d e   f o r   c h e c k i n g   i f   a n   a p p   i s   r u n n i n g   c a m e   f r o m   h e r e :   h t t p : / / c o d e s n i p p e t s . j o y e n t . c o m / p o s t s / s h o w / 1 1 2 4 
 
 # # # # n 8 h e n r i e   S a t   M a r   1 6   1 4 : 4 1 : 4 1   M D T   2 0 1 3 
 *   A d d e d   s e v e r a l   d e l a y s   t h a t   s e e m e d   t o   b e   r e s p o n s i b l e   f o r   b r e a k i n g   t h i s   s c r i p t   i n   i T u n e s   1 1   
 
 # # # # n 8 h e n r i e   S u n   M a r   1 7   0 9 : 5 7 : 4 7   M D T   2 0 1 3 
 *   A d d e d   c o m p a t i b i l i t y   w i t h   i T u n e s   1 0   ( u n t e s t e d ,   p l e a s e   c o n f i r m   i f   y o u   c a n ) 
 *   A d d e d   c o m p a t i b i l i t y   w i t h   h a v i n g   t h e   i T u n e s   s i d e b a r   a c t i v a t e d   ( t h a n k s   t o   m a t t b   i n   t h e   c o m m e n t s ) 
   
  
 l     ��������  ��  ��        l     ��  ��    ] W Check if iTunes is running. If not, start it up and give it 30 seconds to get in gear.     �   �   C h e c k   i f   i T u n e s   i s   r u n n i n g .   I f   n o t ,   s t a r t   i t   u p   a n d   g i v e   i t   3 0   s e c o n d s   t o   g e t   i n   g e a r .      l      ����  V          k           O       I   ������
�� .miscactvnull��� ��� null��  ��    m      �                                                                                  hook  alis    N  Macintosh HD               �@��H+  �I
iTunes.app                                                     ������2        ����  	                Applications    �@��      ��r    �I  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��     ��  I   �� ��
�� .sysodelanull��� ��� nmbr  m    ���� ��  ��    H    
   I    	�������� "0 isitunesrunning isItunesRunning��  ��  ��  ��         l     ��������  ��  ��      ! " ! l     �� # $��   # � z In case anything has stolen focus during the delay, bring it back into focus. I do this several times, after most delays.    $ � % % �   I n   c a s e   a n y t h i n g   h a s   s t o l e n   f o c u s   d u r i n g   t h e   d e l a y ,   b r i n g   i t   b a c k   i n t o   f o c u s .   I   d o   t h i s   s e v e r a l   t i m e s ,   a f t e r   m o s t   d e l a y s . "  & ' & l  ! + (���� ( O  ! + ) * ) I  % *������
�� .miscactvnull��� ��� null��  ��   * m   ! " + +�                                                                                  hook  alis    N  Macintosh HD               �@��H+  �I
iTunes.app                                                     ������2        ����  	                Applications    �@��      ��r    �I  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��   '  , - , l  , 1 .���� . I  , 1�� /��
�� .sysodelanull��� ��� nmbr / m   , -���� ��  ��  ��   -  0 1 0 l     ��������  ��  ��   1  2 3 2 l     �� 4 5��   4 ' !CMD 7 to get to the "Apps" screen    5 � 6 6 B C M D   7   t o   g e t   t o   t h e   " A p p s "   s c r e e n 3  7 8 7 l  2 > 9���� 9 O  2 > : ; : I  6 =�� < =
�� .prcskprsnull���    utxt < m   6 7 > > � ? ?  7 = �� @��
�� 
faal @ m   8 9��
�� eMdsKcmd��   ; m   2 3 A A�                                                                                  sevs  alis    �  Macintosh HD               �@��H+  �ISystem Events.app                                              �y�Ɖ        ����  	                CoreServices    �@��      ���    �I�H��H�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   8  B C B l  ? D D���� D I  ? D�� E��
�� .sysodelanull��� ��� nmbr E m   ? @���� ��  ��  ��   C  F G F l     ��������  ��  ��   G  H I H l  E O J���� J O  E O K L K I  I N������
�� .miscactvnull��� ��� null��  ��   L m   E F M M�                                                                                  hook  alis    N  Macintosh HD               �@��H+  �I
iTunes.app                                                     ������2        ����  	                Applications    �@��      ��r    �I  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��   I  N O N l  P U P���� P I  P U�� Q��
�� .sysodelanull��� ��� nmbr Q m   P Q���� ��  ��  ��   O  R S R l     ��������  ��  ��   S  T U T l     �� V W��   V $ CMD r to check for update apps    W � X X < C M D   r   t o   c h e c k   f o r   u p d a t e   a p p s U  Y Z Y l  V b [���� [ O  V b \ ] \ I  Z a�� ^ _
�� .prcskprsnull���    utxt ^ m   Z [ ` ` � a a  r _ �� b��
�� 
faal b m   \ ]��
�� eMdsKcmd��   ] m   V W c c�                                                                                  sevs  alis    �  Macintosh HD               �@��H+  �ISystem Events.app                                              �y�Ɖ        ����  	                CoreServices    �@��      ���    �I�H��H�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   Z  d e d l  c h f���� f I  c h�� g��
�� .sysodelanull��� ��� nmbr g m   c d���� 
��  ��  ��   e  h i h l     ��������  ��  ��   i  j k j l  i s l���� l O  i s m n m I  m r������
�� .miscactvnull��� ��� null��  ��   n m   i j o o�                                                                                  hook  alis    N  Macintosh HD               �@��H+  �I
iTunes.app                                                     ������2        ����  	                Applications    �@��      ��r    �I  %Macintosh HD:Applications: iTunes.app    
 i T u n e s . a p p    M a c i n t o s h   H D  Applications/iTunes.app   / ��  ��  ��   k  p q p l  t y r���� r I  t y�� s��
�� .sysodelanull��� ��� nmbr s m   t u���� ��  ��  ��   q  t u t l     ��������  ��  ��   u  v w v l     �� x y��   x � {Now for clicking the "Download All Free Updates" button and the "are you old enough" dialog box that often comes afterward.    y � z z � N o w   f o r   c l i c k i n g   t h e   " D o w n l o a d   A l l   F r e e   U p d a t e s "   b u t t o n   a n d   t h e   " a r e   y o u   o l d   e n o u g h "   d i a l o g   b o x   t h a t   o f t e n   c o m e s   a f t e r w a r d . w  { | { l  z� }���� } O   z� ~  ~ O   ~� � � � k   �� � �  � � � r   � � � � � m   � ���
�� boovtrue � 1   � ���
�� 
pisf �  � � � I  � ��� ���
�� .sysodelanull��� ��� nmbr � m   � ����� ��   �  ��� � O   �� � � � k   �� � �  � � � l  � ���������  ��  ��   �  ��� � O   �� � � � k   �� � �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � "  If the sidebar is activated    � � � � 8   I f   t h e   s i d e b a r   i s   a c t i v a t e d �  ��� � Z   �� � ��� � � I  � ��� ���
�� .coredoexbool       obj  � 4   � ��� �
�� 
splg � m   � ����� ��   � k   �C � �  � � � O   �A � � � k   �@ � �  � � � l  � ��� � ���   � #  Compatibility with iTunes 10    � � � � :   C o m p a t i b i l i t y   w i t h   i T u n e s   1 0 �  ��� � Z   �@ � � ��� � I  � ��� ���
�� .coredoexbool       obj  � 4   � ��� �
�� 
uiel � m   � � � � � � �  i T u n e s   s t o r e��   � k   � � � �  � � � O   � � � � � O   � � � � � Z  � � � ����� � I  � �������
�� .coredoexbool       obj ��  ��   � I  � ��� ���
�� .prcsperfactT       actT � 4   � ��� �
�� 
actT � m   � � � � � � �  A X P r e s s��  ��  ��   � 4   � �� �
� 
uiel � m   � � � � � � � 2 D o w n l o a d   A l l   F r e e   U p d a t e s � 4   � ��~ �
�~ 
uiel � m   � � � � � � �  i T u n e s   s t o r e �  � � � l  � ��}�|�{�}  �|  �{   �  ��z � l  � ��y � ��y   �   for iTunes 11    � � � �    f o r   i T u n e s   1 1�z   �  � � � I  �	�x ��w
�x .coredoexbool       obj  � 4   ��v �
�v 
uiel � m   � � � � � ( l o a d i n g   i T u n e s   s t o r e�w   �  ��u � O  < � � � O  ; � � � Z ": � ��t�s � I "'�r�q�p
�r .coredoexbool       obj �q  �p   � I *6�o ��n
�o .prcsperfactT       actT � 4  *2�m �
�m 
actT � m  .1 � � � � �  A X P r e s s�n  �t  �s   � 4  �l �
�l 
uiel � m   � � � � � 2 D o w n l o a d   A l l   F r e e   U p d a t e s � 4  �k �
�k 
uiel � m   � � � � � ( l o a d i n g   i T u n e s   s t o r e�u  ��  ��   � 4   � ��j �
�j 
splg � m   � ��i�i  �  � � � l BB�h�g�f�h  �g  �f   �  ��e � l BB�d � ��d   � ( " If the sidebar is not activated		    � � � � D   I f   t h e   s i d e b a r   i s   n o t   a c t i v a t e d 	 	�e  ��   � k  F� � �  � � � l FF�c � ��c   � #  Compatibility with iTunes 10    � � � � :   C o m p a t i b i l i t y   w i t h   i T u n e s   1 0 �  ��b � Z  F� � � ��a � I FR�` ��_
�` .coredoexbool       obj  � 4  FN�^ �
�^ 
uiel � m  JM � � � � �  i T u n e s   s t o r e�_   � k  U� � �  � � � O  U� � � � O  `� � � � Z k� �]�\  I kp�[�Z�Y
�[ .coredoexbool       obj �Z  �Y   I s�X�W
�X .prcsperfactT       actT 4  s{�V
�V 
actT m  wz �  A X P r e s s�W  �]  �\   � 4  `h�U
�U 
uiel m  dg � 2 D o w n l o a d   A l l   F r e e   U p d a t e s � 4  U]�T	
�T 
uiel	 m  Y\

 �  i T u n e s   s t o r e �  l ���S�R�Q�S  �R  �Q   �P l ���O�O     for iTunes 11    �    f o r   i T u n e s   1 1�P   �  I ���N�M
�N .coredoexbool       obj  4  ���L
�L 
uiel m  �� � ( l o a d i n g   i T u n e s   s t o r e�M   �K O  �� O  �� Z ���J�I I ���H�G�F
�H .coredoexbool       obj �G  �F   I ���E�D
�E .prcsperfactT       actT 4  ���C 
�C 
actT  m  ��!! �""  A X P r e s s�D  �J  �I   4  ���B#
�B 
uiel# m  ��$$ �%% 2 D o w n l o a d   A l l   F r e e   U p d a t e s 4  ���A&
�A 
uiel& m  ��'' �(( ( l o a d i n g   i T u n e s   s t o r e�K  �a  �b  ��   � 4   � ��@)
�@ 
splg) m   � ��?�? ��   � 4   � ��>*
�> 
cwin* m   � ��=�= ��   � 4   ~ ��<+
�< 
prcs+ m   � �,, �--  i T u n e s  m   z {..�                                                                                  sevs  alis    �  Macintosh HD               �@��H+  �ISystem Events.app                                              �y�Ɖ        ����  	                CoreServices    �@��      ���    �I�H��H�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  ��  ��   | /0/ l     �;�:�9�;  �:  �9  0 1�81 i     232 I      �7�6�5�7 "0 isitunesrunning isItunesRunning�6  �5  3 O    454 E    676 l   	8�4�38 n    	9:9 1    	�2
�2 
pnam: 2   �1
�1 
prcs�4  �3  7 m   	 
;; �<<  i T u n e s5 m     ==�                                                                                  sevs  alis    �  Macintosh HD               �@��H+  �ISystem Events.app                                              �y�Ɖ        ����  	                CoreServices    �@��      ���    �I�H��H�  =Macintosh HD:System: Library: CoreServices: System Events.app   $  S y s t e m   E v e n t s . a p p    M a c i n t o s h   H D  -System/Library/CoreServices/System Events.app   / ��  �8       �0>?@�0  > �/�.�/ "0 isitunesrunning isItunesRunning
�. .aevtoappnull  �   � ****? �-3�,�+AB�*�- "0 isitunesrunning isItunesRunning�,  �+  A  B =�)�(;
�) 
prcs
�( 
pnam�* � 	*�-�,�U@ �'C�&�%DE�$
�' .aevtoappnull  �   � ****C k    �FF  GG  &HH  ,II  7JJ  BKK  HLL  NMM  YNN  dOO  jPP  pQQ  {�#�#  �&  �%  D  E &�" �!� � A >���� `��,����� � � �� �� � � � � �
'$!�" "0 isitunesrunning isItunesRunning
�! .miscactvnull��� ��� null�  
� .sysodelanull��� ��� nmbr
� 
faal
� eMdsKcmd
� .prcskprsnull���    utxt� � 

� 
prcs
� 
pisf
� 
cwin
� 
splg
� .coredoexbool       obj 
� 
uiel
� 
actT
� .prcsperfactT       actT�$� h*j+  � *j UO�j [OY��O� *j UOkj O� 	���l 	UO�j O� *j UOkj O� 	���l 	UO�j O� *j UOkj O�T*��/Le*�,FOkj O*a k/6*a k/,*a k/j  �*a k/ �*a a /j  7*a a / &*a a / *j  *a a /j Y hUUOPY E*a a /j  5*a a / &*a a / *j  *a a /j Y hUUY hUOPY �*a a /j  7*a a / &*a a  / *j  *a a !/j Y hUUOPY E*a a "/j  5*a a #/ &*a a $/ *j  *a a %/j Y hUUY hUUUUascr  ��ޭ