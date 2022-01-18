select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,date_dim d,household_demographics hd
where ss.ss_ticket_number = sr.sr_ticket_number and ss.ss_item_sk = i.i_item_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and i.i_hash >= 402 and i.i_hash <= 735 and d.d_hash >= 355 and d.d_hash <= 755 and hd.hd_hash >= 162 and hd.hd_hash <= 912
;
