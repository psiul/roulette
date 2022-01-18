select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 81 and ss.ss_hash <= 481 and i.i_hash >= 47 and i.i_hash <= 380 and c.c_hash >= 44 and c.c_hash <= 794
;
