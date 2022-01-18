select count(ss.ss_item_sk)
from store_sales ss,customer c,store_returns sr,item i,date_dim d
where ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 251 and ss.ss_hash <= 651 and i.i_hash >= 84 and i.i_hash <= 834 and d.d_hash >= 167 and d.d_hash <= 500
;
