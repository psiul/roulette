select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 116 and ss.ss_hash <= 449 and i.i_hash >= 99 and i.i_hash <= 499 and c.c_hash >= 37 and c.c_hash <= 787
;
