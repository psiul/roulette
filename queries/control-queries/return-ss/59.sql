select count(ss.ss_item_sk)
from store_sales ss,date_dim d,customer c,store_returns sr,item i
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and d.d_hash >= 140 and d.d_hash <= 540 and c.c_hash >= 24 and c.c_hash <= 774 and i.i_hash >= 506 and i.i_hash <= 839
;
