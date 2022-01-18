select count(ss.ss_item_sk)
from store_sales ss,store_returns sr,item i,household_demographics hd,date_dim d
where ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_item_sk = i.i_item_sk and sr.sr_hdemo_sk = hd.hd_demo_sk and ss.ss_sold_date_sk = d.d_date_sk and ss.ss_hash >= 228 and ss.ss_hash <= 978 and i.i_hash >= 224 and i.i_hash <= 624 and hd.hd_hash >= 481 and hd.hd_hash <= 814
;
