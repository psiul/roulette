select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_returned_date_sk = d.d_date_sk and ss.ss_hash >= 468 and ss.ss_hash <= 801 and c.c_hash >= 2 and c.c_hash <= 752 and d.d_hash >= 418 and d.d_hash <= 818
;
