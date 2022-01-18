select count(ss.ss_item_sk)
from store_sales ss,item i,customer c,store_returns sr,date_dim d
where ss.ss_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 380 and ss.ss_hash <= 780 and i.i_hash >= 77 and i.i_hash <= 410 and d.d_hash >= 24 and d.d_hash <= 774
;
