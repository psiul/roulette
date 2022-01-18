select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,customer c,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_customer_sk = c.c_customer_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 188 and i.i_hash <= 521 and c.c_hash >= 199 and c.c_hash <= 599 and hd.hd_hash >= 121 and hd.hd_hash <= 871
;
