select count(ss.ss_item_sk)
from store_sales ss,item i
where ss.ss_item_sk = i.i_item_sk and ss.ss_hash >= 337 and ss.ss_hash <= 837 and i.i_hash >= 786 and i.i_hash <= 986
;
