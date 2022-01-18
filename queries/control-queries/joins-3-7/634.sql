select count(ss.ss_item_sk)
from store_sales ss,customer c,item i
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 315 and ss.ss_hash <= 648 and c.c_hash >= 375 and c.c_hash <= 775 and i.i_hash >= 154 and i.i_hash <= 904
;
