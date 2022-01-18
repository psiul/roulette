select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,date_dim d,item i,customer c
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and sr.sr_customer_sk = c.c_customer_sk and ss.ss_hash >= 172 and ss.ss_hash <= 572 and d.d_hash >= 98 and d.d_hash <= 848 and i.i_hash >= 445 and i.i_hash <= 778
;
