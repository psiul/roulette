select count(ss.ss_item_sk)
from store_sales ss,date_dim d,item i,store_returns sr,customer c
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hash >= 40 and ss.ss_hash <= 790 and d.d_hash >= 331 and d.d_hash <= 664 and i.i_hash >= 518 and i.i_hash <= 918
;
