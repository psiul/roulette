select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 37 and ss.ss_hash <= 787 and i.i_hash >= 263 and i.i_hash <= 663 and d.d_hash >= 345 and d.d_hash <= 678
;
