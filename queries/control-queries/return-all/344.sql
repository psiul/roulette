select count(ss.ss_item_sk)
from store_sales ss,household_demographics hd,item i,store_returns sr,customer_demographics cd
where ss.ss_hdemo_sk = hd.hd_demo_sk and ss.ss_item_sk = i.i_item_sk and ss.ss_ticket_number = sr.sr_ticket_number and sr.sr_cdemo_sk = cd.cd_demo_sk and ss.ss_hash >= 61 and ss.ss_hash <= 811 and hd.hd_hash >= 420 and hd.hd_hash <= 820 and cd.cd_hash >= 557 and cd.cd_hash <= 890
;
