select count(ss.ss_item_sk)
from store_sales ss,item i,date_dim d,store_returns sr,customer c
where ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 264 and ss.ss_hash <= 597 and i.i_hash >= 248 and i.i_hash <= 998 and c.c_hash >= 89 and c.c_hash <= 489
;
