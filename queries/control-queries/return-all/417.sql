select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 38 and ss.ss_hash <= 788 and d.d_hash >= 245 and d.d_hash <= 645 and c.c_hash >= 226 and c.c_hash <= 559
;
