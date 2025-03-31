PGDMP                      }           cmccc    17.4    17.4 *               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    24768    cmccc    DATABASE     �   CREATE DATABASE cmccc WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE cmccc;
                     postgres    false            �            1259    24802    student_addresses    TABLE     �   CREATE TABLE public.student_addresses (
    id integer NOT NULL,
    student_id integer,
    street text NOT NULL,
    city text NOT NULL,
    state text NOT NULL,
    zip text NOT NULL
);
 %   DROP TABLE public.student_addresses;
       public         heap r       postgres    false            �            1259    24801    student_addresses_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.student_addresses_id_seq;
       public               postgres    false    224                       0    0    student_addresses_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.student_addresses_id_seq OWNED BY public.student_addresses.id;
          public               postgres    false    223            �            1259    24816    student_classes    TABLE     �   CREATE TABLE public.student_classes (
    id integer NOT NULL,
    student_id integer,
    class_code text NOT NULL,
    class_name text NOT NULL
);
 #   DROP TABLE public.student_classes;
       public         heap r       postgres    false            �            1259    24815    student_classes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_classes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.student_classes_id_seq;
       public               postgres    false    226                       0    0    student_classes_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.student_classes_id_seq OWNED BY public.student_classes.id;
          public               postgres    false    225            �            1259    24788    student_emails    TABLE     q   CREATE TABLE public.student_emails (
    id integer NOT NULL,
    student_id integer,
    email text NOT NULL
);
 "   DROP TABLE public.student_emails;
       public         heap r       postgres    false            �            1259    24787    student_emails_id_seq    SEQUENCE     �   CREATE SEQUENCE public.student_emails_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.student_emails_id_seq;
       public               postgres    false    222                        0    0    student_emails_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.student_emails_id_seq OWNED BY public.student_emails.id;
          public               postgres    false    221            �            1259    24779    students    TABLE     c   CREATE TABLE public.students (
    id integer NOT NULL,
    first_name text,
    last_name text
);
    DROP TABLE public.students;
       public         heap r       postgres    false            �            1259    24770    students_old    TABLE     �   CREATE TABLE public.students_old (
    id integer NOT NULL,
    first_name text,
    last_name text,
    emails text,
    addresses text,
    classes text
);
     DROP TABLE public.students_old;
       public         heap r       postgres    false            �            1259    24769    students_id_seq    SEQUENCE     �   CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.students_id_seq;
       public               postgres    false    218            !           0    0    students_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.students_id_seq OWNED BY public.students_old.id;
          public               postgres    false    217            �            1259    24778    students_id_seq1    SEQUENCE     �   CREATE SEQUENCE public.students_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.students_id_seq1;
       public               postgres    false    220            "           0    0    students_id_seq1    SEQUENCE OWNED BY     D   ALTER SEQUENCE public.students_id_seq1 OWNED BY public.students.id;
          public               postgres    false    219            n           2604    24805    student_addresses id    DEFAULT     |   ALTER TABLE ONLY public.student_addresses ALTER COLUMN id SET DEFAULT nextval('public.student_addresses_id_seq'::regclass);
 C   ALTER TABLE public.student_addresses ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    223    224    224            o           2604    24819    student_classes id    DEFAULT     x   ALTER TABLE ONLY public.student_classes ALTER COLUMN id SET DEFAULT nextval('public.student_classes_id_seq'::regclass);
 A   ALTER TABLE public.student_classes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            m           2604    24791    student_emails id    DEFAULT     v   ALTER TABLE ONLY public.student_emails ALTER COLUMN id SET DEFAULT nextval('public.student_emails_id_seq'::regclass);
 @   ALTER TABLE public.student_emails ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    222    222            l           2604    24782    students id    DEFAULT     k   ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq1'::regclass);
 :   ALTER TABLE public.students ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    220    219    220            k           2604    24773    students_old id    DEFAULT     n   ALTER TABLE ONLY public.students_old ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);
 >   ALTER TABLE public.students_old ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218                      0    24802    student_addresses 
   TABLE DATA           U   COPY public.student_addresses (id, student_id, street, city, state, zip) FROM stdin;
    public               postgres    false    224   e0                 0    24816    student_classes 
   TABLE DATA           Q   COPY public.student_classes (id, student_id, class_code, class_name) FROM stdin;
    public               postgres    false    226   �2                 0    24788    student_emails 
   TABLE DATA           ?   COPY public.student_emails (id, student_id, email) FROM stdin;
    public               postgres    false    222   �4                 0    24779    students 
   TABLE DATA           =   COPY public.students (id, first_name, last_name) FROM stdin;
    public               postgres    false    220   
6                 0    24770    students_old 
   TABLE DATA           ]   COPY public.students_old (id, first_name, last_name, emails, addresses, classes) FROM stdin;
    public               postgres    false    218   �6       #           0    0    student_addresses_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.student_addresses_id_seq', 32, true);
          public               postgres    false    223            $           0    0    student_classes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.student_classes_id_seq', 31, true);
          public               postgres    false    225            %           0    0    student_emails_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.student_emails_id_seq', 64, true);
          public               postgres    false    221            &           0    0    students_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.students_id_seq', 16, true);
          public               postgres    false    217            '           0    0    students_id_seq1    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.students_id_seq1', 32, true);
          public               postgres    false    219            w           2606    24809 (   student_addresses student_addresses_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.student_addresses
    ADD CONSTRAINT student_addresses_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.student_addresses DROP CONSTRAINT student_addresses_pkey;
       public                 postgres    false    224            y           2606    24823 $   student_classes student_classes_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.student_classes
    ADD CONSTRAINT student_classes_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.student_classes DROP CONSTRAINT student_classes_pkey;
       public                 postgres    false    226            u           2606    24795 "   student_emails student_emails_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.student_emails
    ADD CONSTRAINT student_emails_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.student_emails DROP CONSTRAINT student_emails_pkey;
       public                 postgres    false    222            q           2606    24777    students_old students_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.students_old
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.students_old DROP CONSTRAINT students_pkey;
       public                 postgres    false    218            s           2606    24786    students students_pkey1 
   CONSTRAINT     U   ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey1 PRIMARY KEY (id);
 A   ALTER TABLE ONLY public.students DROP CONSTRAINT students_pkey1;
       public                 postgres    false    220            {           2606    24810 3   student_addresses student_addresses_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_addresses
    ADD CONSTRAINT student_addresses_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.student_addresses DROP CONSTRAINT student_addresses_student_id_fkey;
       public               postgres    false    220    4723    224            |           2606    24824 /   student_classes student_classes_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_classes
    ADD CONSTRAINT student_classes_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.student_classes DROP CONSTRAINT student_classes_student_id_fkey;
       public               postgres    false    4723    226    220            z           2606    24796 -   student_emails student_emails_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.student_emails
    ADD CONSTRAINT student_emails_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.student_emails DROP CONSTRAINT student_emails_student_id_fkey;
       public               postgres    false    220    222    4723               3  x�}��n�0�ϫ����H��8q[ �����"Bf#"�dHrӼ}w�?�
�`f�3��$�,gw�-+��-������O`yƹH$QJl�6��d�P(j=�mdV�f��֥���t�H�D��¾���	

��f3��r���&&'5M�M�j����Ad[��}�"6�w���}��(�J9Q&Sl�Ch�G)��Z���wt��qaWy�o8V��'V�f8w���M�T������]����#�eԔ����ʵ��(�j
D&/��ׇ���.����0���XJ��b���b�C=^6�p����}Ÿ�>"�5�i����6�'Q� =R]ڲk}��˻�9�ҐdN`��KY�@T,@_�-��!��^&�ʜ(�d`�5&j�����{r��i���3F��aH���yˡf�ԋ͓>غ�|�����w�����j�:K�����k���#��j���Į)����c��mZ���.���(�H��N�B9L@���]2x����aXJQ�'��.�1�+�'x�<��)�/��P��������sP7�L^>%I�H�0�         �  x�}S�n�0<s�B_P���G�1buT.���2m�I��R��;�J�R@������J�Ҩ]UʉV���ol(v��1��Qf�6��;��s{���~}�	��g��g�4UF��'F�6ۢ�ih�\O3Ƙ(��v��}QU4Wf��v���ȧ��� Zp}�� �u��Җ���Q�bx�����i� =Q����V���f�Y������K��� ���������es�Kn���ۋ]<�I�L߬�k@f��9 �xt)�G�s��!&U!�X�Xl��:๢n�^\p����� Ĭ0@�����X4V���;�+=��trɅ�mWl6�zB�fΦǐ�/�EI�=��ؖ\\p���t�א���^V�8G-�c:�����	�@�%4<��?�3�E�Ec��޻���P�` iK�FTW��+��'�/�xƭsPH	���ܬ��r���7>(8������&�m�яOD� ��         Y  x�e�M�� F��a(E�g��̦K)�����dN?�L�m��U7m[�PS��.��"�hnZ����fh.�A��"�a�E	Mp����5GS�Z��C��n�7�=`./��n�h	�(�"o�3��;�f���$.D�sg��X�V������ѩ�~���=�R�C���"�7*��i�pc��X\	�Yx�$���]�.	���C��l�BF+2��_�&ǌ��Ǻ�w$3�s3N��9��N�xwH���Mr��Z�LZ0�+	����^�B�2�BՃQ��xa�g����WA�A�t`�z�x�ֺ|-My�����
J2����Z��)�ۛ��V�©;p��~HQ���         �   x�-��j�0�o?�Dr�$�@B��)ԁ\zYl�]*KE�]ү�bz[��̘-�(�����rp�'-Bf�Na��E����I�G^4�5�1��T4�_�='�p��6�8���8&����#Z�������T1A��F���3�xN��ĉ�i[�����o>&�;�{]��Ř�}��2s_wF�A��..��Qcp*���R�o,�����F�Q�         �  x�}��r�6����0ls�+!$�	;LL'M�7��`٢��=<|גL�	��a��ҷ~9 O*+Ƚ�d~��o�'�w����O���&gBb�aDg2����x�E��\��x��A8��^@_����d� �ъE�*�U�k'�	?-'�m�2�T�*���+8�sa2��G��Ƕ`H��eJY��ј�D���gQ$J�cbF}��]2���!��xQˬ�HQf�R��4?�-^��;���AeD�"��v��*H�b���\|rۘ�ߣS�2m���b�5L�CG]q���g:�n�C2_�k��Mi�ҹ(����t>[�yf<��F�=2˅<�{�%����ܒh�i��ϵJ��&Ui�k�G��4�}R��͆�����Uv,E�{��:�m΢��U��%���Aq���aK�-�S{� �cΌ��2���(�C���n��!̗-�x�e�e��r�H�4��#Ӊ`����ؠ%�6�A��!�Gi��X!K�rѡ�'Q�*ǃ��X�nW՚K��Ğ�7-`2Geؠr�ayr^�W�j��`�[�}}���j�!u���g�w
N�t	놨4��]4�u��&��=��2lQ��F䉗�# .�օ���m��th<��J�d�B��U�Ow Z�ސ�Ǆ�J��=gD��5��Z���Q�ƀh�F&�Pljc����Xc���ؾ��A�"eZ�c��ꗡ�nBb�GM�FY�`�9�4Ӏ�[3/�gViF֙�YI$��AK�-����ྜ�?�w�?��C�n�L��{}��FVg���ੵ~U��@n��G^pC�� �ߘ�Ț��$w�ol��RW2W,\�}b$+�߇�E]�*\���~kp�:��q�~^[y�8�����E�=��RcD���1hIv��1b������FMpy���I�߳�}�;t��%����H���`Z;�2/��~*���/$�v�l�o]x�Pf�+j��������؆[\7 ��X}��%������`���{���5/�`����2L�H�v�-����6�����ր.v^����EYU�n����ݞ�'�����G [+x�X���>��<�3��f���lоZ��]����U&$K��׀���ٿ��ls�]�a���Q�ْ\��ɞշ-a{Vߴ-ɐίH���*S�?����~�F�ʷ��Q���{��/�$b�     