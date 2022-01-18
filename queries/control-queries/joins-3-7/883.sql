select count(ss.ss_item_sk)
from store_sales ss,item i,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 443 and ss.ss_hash <= 776 and i.i_hash >= 61 and i.i_hash <= 811 and c.c_hash >= 538 and c.c_hash <= 938
;
