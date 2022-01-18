select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,store_returns sr,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 1 and ss.ss_hash <= 751 and d.d_hash >= 402 and d.d_hash <= 735 and c.c_hash >= 28 and c.c_hash <= 428
;
