select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 562 and i.i_hash <= 962 and d.d_hash >= 413 and d.d_hash <= 746 and c.c_hash >= 215 and c.c_hash <= 965
;
