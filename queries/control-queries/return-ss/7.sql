select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 148 and ss.ss_hash <= 481 and d.d_hash >= 60 and d.d_hash <= 460 and c.c_hash >= 76 and c.c_hash <= 826
;
