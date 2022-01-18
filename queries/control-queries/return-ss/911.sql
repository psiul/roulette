select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and sr.sr_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and d.d_hash >= 344 and d.d_hash <= 744 and i.i_hash >= 206 and i.i_hash <= 956 and c.c_hash >= 439 and c.c_hash <= 772
;
