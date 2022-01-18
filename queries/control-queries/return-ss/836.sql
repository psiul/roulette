select count(ss.ss_item_sk)
from store_sales ss,item i,store_returns sr,date_dim d,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 398 and ss.ss_hash <= 731 and i.i_hash >= 69 and i.i_hash <= 819 and d.d_hash >= 195 and d.d_hash <= 595
;
