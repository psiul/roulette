select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,customer c,item i
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 161 and ss.ss_hash <= 911 and d.d_hash >= 385 and d.d_hash <= 785 and c.c_hash >= 386 and c.c_hash <= 719
;
