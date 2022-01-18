select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 347 and ss.ss_hash <= 747 and i.i_hash >= 230 and i.i_hash <= 980 and c.c_hash >= 357 and c.c_hash <= 690
;
