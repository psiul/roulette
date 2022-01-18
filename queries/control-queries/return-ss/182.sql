select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 469 and ss.ss_hash <= 869 and d.d_hash >= 174 and d.d_hash <= 507 and c.c_hash >= 174 and c.c_hash <= 924
;
