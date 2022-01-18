select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 215 and ss.ss_hash <= 965 and d.d_hash >= 19 and d.d_hash <= 419 and i.i_hash >= 654 and i.i_hash <= 987
;
