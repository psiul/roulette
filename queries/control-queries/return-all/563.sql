select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and i.i_hash >= 78 and i.i_hash <= 411 and d.d_hash >= 163 and d.d_hash <= 563 and c.c_hash >= 89 and c.c_hash <= 839
;
