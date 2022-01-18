select count(ss.ss_item_sk)
from store_sales ss,date_dim d,store_returns sr,item i,household_demographics hd
where ss.ss_sold_date_sk = d.d_date_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and ss.ss_hdemo_sk = hd.hd_demo_sk and d.d_hash >= 21 and d.d_hash <= 771 and i.i_hash >= 2 and i.i_hash <= 402 and hd.hd_hash >= 270 and hd.hd_hash <= 603
;
