select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and sr.sr_returned_date_sk = d.d_date_sk and sr.sr_customer_sk = c.c_customer_sk and i.i_hash >= 155 and i.i_hash <= 555 and d.d_hash >= 410 and d.d_hash <= 743 and c.c_hash >= 94 and c.c_hash <= 844
;
