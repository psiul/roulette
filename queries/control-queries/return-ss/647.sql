select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and d.d_hash >= 218 and d.d_hash <= 968 and i.i_hash >= 273 and i.i_hash <= 606 and c.c_hash >= 552 and c.c_hash <= 952
;
