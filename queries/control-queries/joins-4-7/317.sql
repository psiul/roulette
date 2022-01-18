select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 546 and ss.ss_hash <= 879 and i.i_hash >= 86 and i.i_hash <= 836 and c.c_hash >= 528 and c.c_hash <= 928
;
