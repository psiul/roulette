select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_item_sk = i.i_item_sk and d.d_hash >= 529 and d.d_hash <= 862 and c.c_hash >= 303 and c.c_hash <= 703 and i.i_hash >= 204 and i.i_hash <= 954
;
