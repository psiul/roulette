select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,customer c,date_dim d,item i
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_customer_sk = c.c_customer_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 24 and ss.ss_hash <= 424 and c.c_hash >= 161 and c.c_hash <= 494 and i.i_hash >= 81 and i.i_hash <= 831
;
