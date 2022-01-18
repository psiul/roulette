select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 226 and ss.ss_hash <= 976 and c.c_hash >= 495 and c.c_hash <= 828 and i.i_hash >= 60 and i.i_hash <= 460
;
