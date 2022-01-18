select count(ss.ss_item_sk)
from store_sales ss,customer_demographics cd,item i,store_returns sr,household_demographics hd
where ss.ss_cdemo_sk = cd.cd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_hdemo_sk = hd.hd_demo_sk and cd.cd_hash >= 68 and cd.cd_hash <= 401 and i.i_hash >= 168 and i.i_hash <= 918 and hd.hd_hash >= 201 and hd.hd_hash <= 601
;
