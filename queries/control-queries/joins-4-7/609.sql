select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 549 and ss.ss_hash <= 882 and d.d_hash >= 65 and d.d_hash <= 815 and c.c_hash >= 138 and c.c_hash <= 538
;
