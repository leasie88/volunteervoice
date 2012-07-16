class ProgramsController < ApplicationController

	include ActionView::Helpers::TextHelper
	require 'aws/s3'
	
	
	def crop
    if user_signed_in? && current_user.admin?
      @program = Program.find(params[:id])
    else
      redirect_to "/pages/blogs"
    end
  end
	
  # GET /programs
  # GET /programs.json
  def index
    @programs = Program.all
    @allCountries = ['AF', 
  	'AX', 
  	'AL', 
  	'DZ', 
  	'AS', 
  	'AD', 
  	'AO', 
  	'AI', 
  	'AG', 
  	'AR', 
  	'AM', 
  	'AW', 
  	'AU', 
  	'AT', 
  	'AZ', 
  	'BS', 
  	'BH', 
  	'BD', 
  	'BB', 
  	'BY', 
  	'BE', 
  	'BZ', 
  	'BJ', 
  	'BM', 
  	'BT', 
  	'BO', 
  	'BA', 
  	'BW', 
  	'BR', 
  	'BN', 
  	'BG', 
  	'BF', 
  	'BI', 
  	'KH', 
  	'CM', 
  	'CA', 
  	'CV', 
  	'KY', 
  	'CF', 
  	'TD', 
  	'CL', 
  	'CN', 
  	'CO', 
  	'KM', 
  	'CG', 
  	'CD', 
  	'CK', 
  	'CR', 
  	'CI', 
  	'HR', 
  	'CU', 
  	'CY', 
  	'CZ', 
  	'DK', 
  	'DJ', 
  	'DM', 
  	'DO', 
  	'EC', 
  	'EG', 
  	'SV', 
  	'GQ', 
  	'ER', 
  	'EE', 
  	'ET', 
  	'FK', 
  	'FO', 
  	'FJ', 
  	'FI', 
  	'FR', 
  	'GF', 
  	'PF', 
  	'GA', 
  	'GM', 
  	'GE', 
  	'DE', 
  	'GH', 
  	'GI', 
  	'GR', 
  	'GL', 
  	'GD', 
  	'GP', 
  	'GU', 
  	'GT', 
  	'GG', 
  	'GN', 
  	'GW', 
  	'GY', 
  	'HT', 
  	'VA', 
  	'HN', 
  	'HK', 
  	'HU', 
  	'IS', 
  	'IN', 
  	'ID', 
  	'IR', 
  	'IQ', 
  	'IE', 
  	'IM', 
  	'IL', 
  	'IT', 
  	'JM', 
  	'JP', 
  	'JE', 
  	'JO', 
  	'KZ', 
  	'KE', 
  	'KI', 
  	'KP', 
  	'KR', 
  	'KW', 
  	'KG', 
  	'LA', 
  	'LV', 
  	'LB', 
  	'LS', 
  	'LR', 
  	'LY', 
  	'LI', 
  	'LT', 
  	'LU', 
  	'MO', 
  	'MK', 
  	'MG', 
  	'MW', 
  	'MY', 
  	'MV', 
  	'ML', 
  	'MT', 
  	'MH', 
  	'MQ', 
  	'MR', 
  	'MU', 
  	'YT', 
  	'MX', 
  	'FM', 
  	'MD', 
  	'MC', 
  	'MN', 
  	'ME', 
  	'MS', 
  	'MZ', 
  	'MM', 
  	'NA', 
  	'NR', 
  	'NP', 
  	'NL', 
  	'NC', 
  	'NZ', 
  	'NI', 
  	'NE', 
  	'NG', 
  	'NU', 
  	'NF', 
  	'MP', 
  	'NO', 
  	'OM', 
  	'PK', 
  	'PW', 
  	'PS', 
  	'PA', 
  	'PG', 
  	'PY', 
  	'PE', 
  	'PH', 
  	'PN', 
  	'PL', 
  	'PT', 
  	'PR', 
  	'QA', 
  	'RE', 
  	'RO', 
  	'RU', 
  	'RW', 
  	'BL', 
  	'SH', 
  	'KN', 
  	'LC', 
  	'MF', 
  	'PM', 
  	'VC', 
  	'WS', 
  	'SM', 
  	'ST', 
  	'SA', 
  	'SN', 
  	'RS', 
  	'SC', 
  	'SL', 
  	'SG', 
  	'SK', 
  	'SI', 
  	'SB', 
  	'SO', 
  	'ZA', 
  	'ES', 
  	'LK', 
  	'SD', 
  	'SR', 
  	'SJ', 
  	'SZ', 
  	'SE', 
  	'CH', 
  	'SY', 
  	'TW', 
  	'TJ', 
  	'TZ', 
  	'TH', 
  	'TL', 
  	'TG', 
  	'TK', 
  	'TO', 
  	'TT', 
  	'TN', 
  	'TR', 
  	'TM', 
  	'TC', 
  	'TV', 
  	'UG', 
  	'UA', 
  	'AE', 
  	'GB', 
  	'US', 
  	'UY', 
  	'UZ', 
  	'VU', 
  	'VE', 
  	'VN', 
  	'VG', 
  	'VI', 
  	'WF', 
  	'EH', 
  	'YE', 
  	'ZM', 
  	'ZW']
    @theRegions = [['AQ', 
    'BQ', 
    'BV', 
    'IO', 
    'CX', 
    'CC', 
    'CW', 
    'TF', 
    'HM', 
    'SX', 
    'GS', 
    'SS', 
    'UM'], 
    ['DZ', 
    'EG', 
    'LY', 
    'MA', 
    'SD', 
    'TN', 
    'EH'],
    ['BJ', 
    'BF', 
    'CV', 
    'CI', 
    'GM', 
    'GH', 
    'GN', 
    'GW', 
    'LR', 
    'ML', 
    'MR', 
    'NE', 
    'NG', 
    'SH', 
    'SN', 
    'SL', 
    'TG'],
    ['AO', 
    'CM', 
    'CF', 
    'TD', 
    'CG', 
    'CD', 
    'GQ', 
    'GA', 
    'ST'],
    ['BI', 
    'KM', 
    'DJ', 
    'ER', 
    'ET', 
    'KE', 
    'MG', 
    'MW', 
    'MU', 
    'YT', 
    'MZ', 
    'RE', 
    'RW', 
    'SC', 
    'SO', 
    'TZ', 
    'UG', 
    'ZM', 
    'ZW'],
    ['BW', 
    'LS', 
    'NA', 
    'ZA', 
    'SZ'],
    ['AX', 
    'DK', 
    'EE', 
    'FO', 
    'FI', 
    'GG', 
    'IS', 
    'IE', 
    'IM', 
    'JE', 
    'LV', 
    'LT', 
    'NO', 
    'SJ', 
    'SE', 
    'GB'],
    ['AT', 
    'BE', 
    'FR', 
    'DE', 
    'LI', 
    'LU', 
    'MC', 
    'NL', 
    'CH'],
    ['BY', 
    'BG', 
    'CZ', 
    'HU', 
    'MD', 
    'PL', 
    'RO', 
    'RU', 
    'SK', 
    'UA'],
    ['AL', 
    'AD', 
    'BA', 
    'HR', 
    'GI', 
    'GR', 
    'VA', 
    'IT', 
    'MK', 
    'MT', 
    'ME', 
    'PT', 
    'SM', 
    'RS', 
    'SI', 
    'ES'],
    ['BM', 
    'CA', 
    'GL', 
    'PM', 
    'US'],
    ['AI', 
    'AG', 
    'AW', 
    'BS', 
    'BB', 
    'KY', 
    'CU', 
    'DM', 
    'DO', 
    'GD', 
    'GP', 
    'HT', 
    'JM', 
    'MQ', 
    'MS', 
    'PR', 
    'BL', 
    'KN', 
    'LC', 
    'MF', 
    'VC', 
    'TT', 
    'TC', 
    'VG', 
    'VI'],
    ['BZ', 
    'CR', 
    'SV', 
    'GT', 
    'HN', 
    'MX', 
    'NI', 
    'PA'],
    ['AR', 
    'BO', 
    'BR', 
    'CL', 
    'CO', 
    'EC', 
    'FK', 
    'GF', 
    'GY', 
    'PY', 
    'PE', 
    'SR', 
    'UY', 
    'VE'],
    ['KZ', 
    'KG', 
    'TJ', 
    'TM', 
    'UZ'],
    ['CN', 
    'HK', 
    'JP', 
    'KP', 
    'KR', 
    'MO', 
    'MN', 
    'TW'],
    ['AF', 
    'BD', 
    'BT', 
    'IN', 
    'IR', 
    'MV', 
    'NP', 
    'PK', 
    'LK'],
    ['BN', 
    'KH', 
    'ID', 
    'LA', 
    'MY', 
    'MM', 
    'PH', 
    'SG', 
    'TH', 
    'TL', 
    'VN'],
    ['AM', 
    'AZ', 
    'BH', 
    'CY', 
    'GE', 
    'IQ', 
    'IL', 
    'JO', 
    'KW', 
    'LB', 
    'OM', 
    'PS', 
    'QA', 
    'SA', 
    'SY', 
    'TR', 
    'AE', 
    'YE'],
    ['AU', 
    'NZ', 
    'NF'],
    ['FJ', 
    'NC', 
    'PG', 
    'SB', 
    'VU'],
    ['GU', 
    'KI', 
    'MH', 
    'FM', 
    'NR', 
    'MP', 
    'PW'],
    ['AS', 
    'CK', 
    'PF', 
    'NU', 
    'PN', 
    'WS', 
    'TK', 
    'TO', 
    'TV', 
    'WF']]
    
    @theCountries = Hash["AF" => "Afghanistan", 
    "AX" => "Aland Islands", 
    "AL"=> "Albania", 
    "DZ"=> "Algeria", 
    "AS"=> "American Samoa", 
    "AD"=> "Andorra", 
    "AO"=> "Angola", 
    "AI"=> "Anguilla", 
    "AQ"=> "Antarctica", 
    "AG"=> "Antigua and Barbuda", 
    "AR"=> "Argentina", 
    "AM"=> "Armenia", 
    "AW"=> "Aruba", 
    "AU"=> "Australia", 
    "AT"=> "Austria", 
    "AZ"=> "Azerbaijan", 
    "BS"=> "Bahamas", 
    "BH"=> "Bahrain", 
    "BD"=> "Bangladesh", 
    "BB"=> "Barbados", 
    "BY"=> "Belarus", 
    "BE"=> "Belgium", 
    "BZ"=> "Belize", 
    "BJ"=> "Benin", 
    "BM"=> "Bermuda", 
    "BT"=> "Bhutan", 
    "BO"=> "Bolivia, Plurinational State of", 
    "BQ"=> "Bonaire, Sint Eustatius and Saba", 
    "BA"=> "Bosnia and Herzegovina", 
    "BW"=> "Botswana", 
    "BV"=> "Bouvet Island", 
    "BR"=> "Brazil", 
    "IO"=> "British Indian Ocean Territory", 
    "BN"=> "Brunei Darussalam", 
    "BG"=> "Bulgaria", 
    "BF"=> "Burkina Faso", 
    "BI"=> "Burundi", 
    "KH"=> "Cambodia", 
    "CM"=> "Cameroon", 
    "CA"=> "Canada", 
    "CV"=> "Cape Verde", 
    "KY"=> "Cayman Islands", 
    "CF"=> "Central African Republic", 
    "TD"=> "Chad", 
    "CL"=> "Chile", 
    "CN"=> "China", 
    "CX"=> "Christmas Island", 
    "CC"=> "Cocos (Keeling) Islands", 
    "CO"=> "Colombia", 
    "KM"=> "Comoros", 
    "CG"=> "Congo", 
    "CD"=> "Congo, the Democratic Republic of the", 
    "CK"=> "Cook Islands", 
    "CR"=> "Costa Rica", 
    "CI"=> "Cote d'Ivoire", 
    "HR"=> "Croatia", 
    "CU"=> "Cuba", 
    "CW"=> "Curacao", 
    "CY"=> "Cyprus", 
    "CZ"=> "Czech Republic", 
    "DK"=> "Denmark", 
    "DJ"=> "Djibouti", 
    "DM"=> "Dominica", 
    "DO"=> "Dominican Republic", 
    "EC"=> "Ecuador", 
    "EG"=> "Egypt", 
    "SV"=> "El Salvador", 
    "GQ"=> "Equatorial Guinea", 
    "ER"=> "Eritrea", 
    "EE"=> "Estonia", 
    "ET"=> "Ethiopia", 
    "FK"=> "Falkland Islands (Malvinas)", 
    "FO"=> "Faroe Islands", 
    "FJ"=> "Fiji", 
    "FI"=> "Finland", 
    "FR"=> "France", 
    "GF"=> "French Guiana", 
    "PF"=> "French Polynesia", 
    "TF"=> "French Southern Territories", 
    "GA"=> "Gabon", 
    "GM"=> "Gambia", 
    "GE"=> "Georgia", 
    "DE"=> "Germany", 
    "GH"=> "Ghana", 
    "GI"=> "Gibraltar", 
    "GR"=> "Greece", 
    "GL"=> "Greenland", 
    "GD"=> "Grenada", 
    "GP"=> "Guadeloupe", 
    "GU"=> "Guam", 
    "GT"=> "Guatemala", 
    "GG"=> "Guernsey", 
    "GN"=> "Guinea", 
    "GW"=> "Guinea-Bissau", 
    "GY"=> "Guyana", 
    "HT"=> "Haiti", 
    "HM"=> "Heard Island and McDonald Islands", 
    "VA"=> "Holy See (Vatican City State)", 
    "HN"=> "Honduras", 
    "HK"=> "Hong Kong", 
    "HU"=> "Hungary", 
    "IS"=> "Iceland", 
    "IN"=> "India", 
    "ID"=> "Indonesia", 
    "IR"=> "Iran, Islamic Republic of", 
    "IQ"=> "Iraq", 
    "IE"=> "Ireland", 
    "IM"=> "Isle of Man", 
    "IL"=> "Israel", 
    "IT"=> "Italy", 
    "JM"=> "Jamaica", 
    "JP"=> "Japan", 
    "JE"=> "Jersey", 
    "JO"=> "Jordan", 
    "KZ"=> "Kazakhstan", 
    "KE"=> "Kenya", 
    "KI"=> "Kiribati", 
    "KP"=> "Korea, Democratic People's Republic of", 
    "KR"=> "Korea, Republic of", 
    "KW"=> "Kuwait", 
    "KG"=> "Kyrgyzstan", 
    "LA"=> "Lao People's Democratic Republic", 
    "LV"=> "Latvia", 
    "LB"=> "Lebanon", 
    "LS"=> "Lesotho", 
    "LR"=> "Liberia", 
    "LY"=> "Libya", 
    "LI"=> "Liechtenstein", 
    "LT"=> "Lithuania", 
    "LU"=> "Luxembourg", 
    "MO"=> "Macao", 
    "MK"=> "Macedonia, the former Yugoslav Republic of", 
    "MG"=> "Madagascar", 
    "MW"=> "Malawi", 
    "MY"=> "Malaysia", 
    "MV"=> "Maldives", 
    "ML"=> "Mali", 
    "MT"=> "Malta", 
    "MH"=> "Marshall Islands", 
    "MQ"=> "Martinique", 
    "MR"=> "Mauritania", 
    "MU"=> "Mauritius", 
    "YT"=> "Mayotte", 
    "MX"=> "Mexico", 
    "FM"=> "Micronesia, Federated States of", 
    "MD"=> "Moldova, Republic of", 
    "MC"=> "Monaco", 
    "MN"=> "Mongolia", 
    "ME"=> "Montenegro", 
    "MS"=> "Montserrat", 
    "MA"=> "Morocco", 
    "MZ"=> "Mozambique", 
    "MM"=> "Myanmar", 
    "NA"=> "Namibia", 
    "NR"=> "Nauru", 
    "NP"=> "Nepal", 
    "NL"=> "Netherlands", 
    "NC"=> "New Caledonia", 
    "NZ"=> "New Zealand", 
    "NI"=> "Nicaragua", 
    "NE"=> "Niger", 
    "NG"=> "Nigeria", 
    "NU"=> "Niue", 
    "NF"=> "Norfolk Island", 
    "MP"=> "Northern Mariana Islands", 
    "NO"=> "Norway", 
    "OM"=> "Oman", 
    "PK"=> "Pakistan", 
    "PW"=> "Palau", 
    "PS"=> "Palestinian Territory, Occupied", 
    "PA"=> "Panama", 
    "PG"=> "Papua New Guinea", 
    "PY"=> "Paraguay", 
    "PE"=> "Peru", 
    "PH"=> "Philippines", 
    "PN"=> "Pitcairn", 
    "PL"=> "Poland", 
    "PT"=> "Portugal", 
    "PR"=> "Puerto Rico", 
    "QA"=> "Qatar", 
    "RE"=> "Reunion", 
    "RO"=> "Romania", 
    "RU"=> "Russian Federation", 
    "RW"=> "Rwanda", 
    "BL"=> "Saint Barthelemy", 
    "SH"=> "Saint Helena, Ascension and Tristan da Cunha", 
    "KN"=> "Saint Kitts and Nevis", 
    "LC"=> "Saint Lucia", 
    "MF"=> "Saint Martin (French part)", 
    "PM"=> "Saint Pierre and Miquelon", 
    "VC"=> "Saint Vincent and the Grenadines", 
    "WS"=> "Samoa", 
    "SM"=> "San Marino", 
    "ST"=> "Sao Tome and Principe", 
    "SA"=> "Saudi Arabia", 
    "SN"=> "Senegal", 
    "RS"=> "Serbia", 
    "SC"=> "Seychelles", 
    "SL"=> "Sierra Leone", 
    "SG"=> "Singapore", 
    "SX"=> "Sint Maarten (Dutch part)", 
    "SK"=> "Slovakia", 
    "SI"=> "Slovenia", 
    "SB"=> "Solomon Islands", 
    "SO"=> "Somalia", 
    "ZA"=> "South Africa", 
    "GS"=> "South Georgia and the South Sandwich Islands", 
    "SS"=> "South Sudan", 
    "ES"=> "Spain", 
    "LK"=> "Sri Lanka", 
    "SD"=> "Sudan", 
    "SR"=> "Suriname", 
    "SJ"=> "Svalbard and Jan Mayen", 
    "SZ"=> "Swaziland", 
    "SE"=> "Sweden", 
    "CH"=> "Switzerland", 
    "SY"=> "Syrian Arab Republic", 
    "TW"=> "Taiwan, Province of China", 
    "TJ"=> "Tajikistan", 
    "TZ"=> "Tanzania, United Republic of", 
    "TH"=> "Thailand", 
    "TL"=> "Timor-Leste", 
    "TG"=> "Togo", 
    "TK"=> "Tokelau", 
    "TO"=> "Tonga", 
    "TT"=> "Trinidad and Tobago", 
    "TN"=> "Tunisia", 
    "TR"=> "Turkey", 
    "TM"=> "Turkmenistan", 
    "TC"=> "Turks and Caicos Islands", 
    "TV"=> "Tuvalu", 
    "UG"=> "Uganda", 
    "UA"=> "Ukraine", 
    "AE"=> "United Arab Emirates", 
    "GB"=> "United Kingdom", 
    "US"=> "United States", 
    "UM"=> "United States Minor Outlying Islands", 
    "UY"=> "Uruguay", 
    "UZ"=> "Uzbekistan", 
    "VU"=> "Vanuatu", 
    "VE"=> "Venezuela, Bolivarian Republic of", 
    "VN"=> "Viet Nam", 
    "VG"=> "Virgin Islands, British", 
    "VI"=> "Virgin Islands, U.S.", 
    "WF"=> "Wallis and Futuna", 
    "EH"=> "Western Sahara", 
    "YE"=> "Yemen", 
    "ZM"=> "Zambia", 
    "ZW"=> "Zimbabwe"]
    
    @countries_with_programs = []
    @programs.each do |f|
      @countries_with_programs << f.location unless @countries_with_programs.include?(f.location)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @programs }
    end

  end

  # GET /programs/1
  # GET /programs/1.json
  def show
    @program = Program.find(params[:id])
     @results = Review.where(:program_id => @program.id).sort_by(&:created_at).reverse
     @overall = 0
     @results.each do |f|
       @overall = @overall + f.overall
     end
     if @results.count != 0
       @overall = @overall / @results.count
     else
       @overall = 0
     end
     @flag = Flag.new
     @theCountries = Hash["AF" => "Afghanistan", 
     "AX" => "Aland Islands", 
     "AL"=> "Albania", 
     "DZ"=> "Algeria", 
     "AS"=> "American Samoa", 
     "AD"=> "Andorra", 
     "AO"=> "Angola", 
     "AI"=> "Anguilla", 
     "AQ"=> "Antarctica", 
     "AG"=> "Antigua and Barbuda", 
     "AR"=> "Argentina", 
     "AM"=> "Armenia", 
     "AW"=> "Aruba", 
     "AU"=> "Australia", 
     "AT"=> "Austria", 
     "AZ"=> "Azerbaijan", 
     "BS"=> "Bahamas", 
     "BH"=> "Bahrain", 
     "BD"=> "Bangladesh", 
     "BB"=> "Barbados", 
     "BY"=> "Belarus", 
     "BE"=> "Belgium", 
     "BZ"=> "Belize", 
     "BJ"=> "Benin", 
     "BM"=> "Bermuda", 
     "BT"=> "Bhutan", 
     "BO"=> "Bolivia, Plurinational State of", 
     "BQ"=> "Bonaire, Sint Eustatius and Saba", 
     "BA"=> "Bosnia and Herzegovina", 
     "BW"=> "Botswana", 
     "BV"=> "Bouvet Island", 
     "BR"=> "Brazil", 
     "IO"=> "British Indian Ocean Territory", 
     "BN"=> "Brunei Darussalam", 
     "BG"=> "Bulgaria", 
     "BF"=> "Burkina Faso", 
     "BI"=> "Burundi", 
     "KH"=> "Cambodia", 
     "CM"=> "Cameroon", 
     "CA"=> "Canada", 
     "CV"=> "Cape Verde", 
     "KY"=> "Cayman Islands", 
     "CF"=> "Central African Republic", 
     "TD"=> "Chad", 
     "CL"=> "Chile", 
     "CN"=> "China", 
     "CX"=> "Christmas Island", 
     "CC"=> "Cocos (Keeling) Islands", 
     "CO"=> "Colombia", 
     "KM"=> "Comoros", 
     "CG"=> "Congo", 
     "CD"=> "Congo, the Democratic Republic of the", 
     "CK"=> "Cook Islands", 
     "CR"=> "Costa Rica", 
     "CI"=> "Cote d'Ivoire", 
     "HR"=> "Croatia", 
     "CU"=> "Cuba", 
     "CW"=> "Curacao", 
     "CY"=> "Cyprus", 
     "CZ"=> "Czech Republic", 
     "DK"=> "Denmark", 
     "DJ"=> "Djibouti", 
     "DM"=> "Dominica", 
     "DO"=> "Dominican Republic", 
     "EC"=> "Ecuador", 
     "EG"=> "Egypt", 
     "SV"=> "El Salvador", 
     "GQ"=> "Equatorial Guinea", 
     "ER"=> "Eritrea", 
     "EE"=> "Estonia", 
     "ET"=> "Ethiopia", 
     "FK"=> "Falkland Islands (Malvinas)", 
     "FO"=> "Faroe Islands", 
     "FJ"=> "Fiji", 
     "FI"=> "Finland", 
     "FR"=> "France", 
     "GF"=> "French Guiana", 
     "PF"=> "French Polynesia", 
     "TF"=> "French Southern Territories", 
     "GA"=> "Gabon", 
     "GM"=> "Gambia", 
     "GE"=> "Georgia", 
     "DE"=> "Germany", 
     "GH"=> "Ghana", 
     "GI"=> "Gibraltar", 
     "GR"=> "Greece", 
     "GL"=> "Greenland", 
     "GD"=> "Grenada", 
     "GP"=> "Guadeloupe", 
     "GU"=> "Guam", 
     "GT"=> "Guatemala", 
     "GG"=> "Guernsey", 
     "GN"=> "Guinea", 
     "GW"=> "Guinea-Bissau", 
     "GY"=> "Guyana", 
     "HT"=> "Haiti", 
     "HM"=> "Heard Island and McDonald Islands", 
     "VA"=> "Holy See (Vatican City State)", 
     "HN"=> "Honduras", 
     "HK"=> "Hong Kong", 
     "HU"=> "Hungary", 
     "IS"=> "Iceland", 
     "IN"=> "India", 
     "ID"=> "Indonesia", 
     "IR"=> "Iran, Islamic Republic of", 
     "IQ"=> "Iraq", 
     "IE"=> "Ireland", 
     "IM"=> "Isle of Man", 
     "IL"=> "Israel", 
     "IT"=> "Italy", 
     "JM"=> "Jamaica", 
     "JP"=> "Japan", 
     "JE"=> "Jersey", 
     "JO"=> "Jordan", 
     "KZ"=> "Kazakhstan", 
     "KE"=> "Kenya", 
     "KI"=> "Kiribati", 
     "KP"=> "Korea, Democratic People's Republic of", 
     "KR"=> "Korea, Republic of", 
     "KW"=> "Kuwait", 
     "KG"=> "Kyrgyzstan", 
     "LA"=> "Lao People's Democratic Republic", 
     "LV"=> "Latvia", 
     "LB"=> "Lebanon", 
     "LS"=> "Lesotho", 
     "LR"=> "Liberia", 
     "LY"=> "Libya", 
     "LI"=> "Liechtenstein", 
     "LT"=> "Lithuania", 
     "LU"=> "Luxembourg", 
     "MO"=> "Macao", 
     "MK"=> "Macedonia, the former Yugoslav Republic of", 
     "MG"=> "Madagascar", 
     "MW"=> "Malawi", 
     "MY"=> "Malaysia", 
     "MV"=> "Maldives", 
     "ML"=> "Mali", 
     "MT"=> "Malta", 
     "MH"=> "Marshall Islands", 
     "MQ"=> "Martinique", 
     "MR"=> "Mauritania", 
     "MU"=> "Mauritius", 
     "YT"=> "Mayotte", 
     "MX"=> "Mexico", 
     "FM"=> "Micronesia, Federated States of", 
     "MD"=> "Moldova, Republic of", 
     "MC"=> "Monaco", 
     "MN"=> "Mongolia", 
     "ME"=> "Montenegro", 
     "MS"=> "Montserrat", 
     "MA"=> "Morocco", 
     "MZ"=> "Mozambique", 
     "MM"=> "Myanmar", 
     "NA"=> "Namibia", 
     "NR"=> "Nauru", 
     "NP"=> "Nepal", 
     "NL"=> "Netherlands", 
     "NC"=> "New Caledonia", 
     "NZ"=> "New Zealand", 
     "NI"=> "Nicaragua", 
     "NE"=> "Niger", 
     "NG"=> "Nigeria", 
     "NU"=> "Niue", 
     "NF"=> "Norfolk Island", 
     "MP"=> "Northern Mariana Islands", 
     "NO"=> "Norway", 
     "OM"=> "Oman", 
     "PK"=> "Pakistan", 
     "PW"=> "Palau", 
     "PS"=> "Palestinian Territory, Occupied", 
     "PA"=> "Panama", 
     "PG"=> "Papua New Guinea", 
     "PY"=> "Paraguay", 
     "PE"=> "Peru", 
     "PH"=> "Philippines", 
     "PN"=> "Pitcairn", 
     "PL"=> "Poland", 
     "PT"=> "Portugal", 
     "PR"=> "Puerto Rico", 
     "QA"=> "Qatar", 
     "RE"=> "Reunion", 
     "RO"=> "Romania", 
     "RU"=> "Russian Federation", 
     "RW"=> "Rwanda", 
     "BL"=> "Saint Barthelemy", 
     "SH"=> "Saint Helena, Ascension and Tristan da Cunha", 
     "KN"=> "Saint Kitts and Nevis", 
     "LC"=> "Saint Lucia", 
     "MF"=> "Saint Martin (French part)", 
     "PM"=> "Saint Pierre and Miquelon", 
     "VC"=> "Saint Vincent and the Grenadines", 
     "WS"=> "Samoa", 
     "SM"=> "San Marino", 
     "ST"=> "Sao Tome and Principe", 
     "SA"=> "Saudi Arabia", 
     "SN"=> "Senegal", 
     "RS"=> "Serbia", 
     "SC"=> "Seychelles", 
     "SL"=> "Sierra Leone", 
     "SG"=> "Singapore", 
     "SX"=> "Sint Maarten (Dutch part)", 
     "SK"=> "Slovakia", 
     "SI"=> "Slovenia", 
     "SB"=> "Solomon Islands", 
     "SO"=> "Somalia", 
     "ZA"=> "South Africa", 
     "GS"=> "South Georgia and the South Sandwich Islands", 
     "SS"=> "South Sudan", 
     "ES"=> "Spain", 
     "LK"=> "Sri Lanka", 
     "SD"=> "Sudan", 
     "SR"=> "Suriname", 
     "SJ"=> "Svalbard and Jan Mayen", 
     "SZ"=> "Swaziland", 
     "SE"=> "Sweden", 
     "CH"=> "Switzerland", 
     "SY"=> "Syrian Arab Republic", 
     "TW"=> "Taiwan, Province of China", 
     "TJ"=> "Tajikistan", 
     "TZ"=> "Tanzania, United Republic of", 
     "TH"=> "Thailand", 
     "TL"=> "Timor-Leste", 
     "TG"=> "Togo", 
     "TK"=> "Tokelau", 
     "TO"=> "Tonga", 
     "TT"=> "Trinidad and Tobago", 
     "TN"=> "Tunisia", 
     "TR"=> "Turkey", 
     "TM"=> "Turkmenistan", 
     "TC"=> "Turks and Caicos Islands", 
     "TV"=> "Tuvalu", 
     "UG"=> "Uganda", 
     "UA"=> "Ukraine", 
     "AE"=> "United Arab Emirates", 
     "GB"=> "United Kingdom", 
     "US"=> "United States", 
     "UM"=> "United States Minor Outlying Islands", 
     "UY"=> "Uruguay", 
     "UZ"=> "Uzbekistan", 
     "VU"=> "Vanuatu", 
     "VE"=> "Venezuela, Bolivarian Republic of", 
     "VN"=> "Viet Nam", 
     "VG"=> "Virgin Islands, British", 
     "VI"=> "Virgin Islands, U.S.", 
     "WF"=> "Wallis and Futuna", 
     "EH"=> "Western Sahara", 
     "YE"=> "Yemen", 
     "ZM"=> "Zambia", 
     "ZW"=> "Zimbabwe"]




    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @program }
    end
  end

  # GET /programs/new
  # GET /programs/new.json
  def new
    @program = Program.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @program }
    end
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
    @program.description = @program.description.gsub(%r{</?[^>]+?>}, '')
    @program.program_structure = @program.program_structure.gsub(%r{</?[^>]+?>}, '')
    @program.program_cost_breakdown = @program.program_cost_breakdown.gsub(%r{</?[^>]+?>}, '')
    @program.cost_includes = @program.cost_includes.gsub(%r{</?[^>]+?>}, '')
    @program.cost_doesnt_include = @program.cost_doesnt_include.gsub(%r{</?[^>]+?>}, '')
    
  end

  # POST /programs
  # POST /programs.json
  def create
    @theCountries = Hash["AF" => "Afghanistan", 
    "AX" => "Aland Islands", 
    "AL"=> "Albania", 
    "DZ"=> "Algeria", 
    "AS"=> "American Samoa", 
    "AD"=> "Andorra", 
    "AO"=> "Angola", 
    "AI"=> "Anguilla", 
    "AQ"=> "Antarctica", 
    "AG"=> "Antigua and Barbuda", 
    "AR"=> "Argentina", 
    "AM"=> "Armenia", 
    "AW"=> "Aruba", 
    "AU"=> "Australia", 
    "AT"=> "Austria", 
    "AZ"=> "Azerbaijan", 
    "BS"=> "Bahamas", 
    "BH"=> "Bahrain", 
    "BD"=> "Bangladesh", 
    "BB"=> "Barbados", 
    "BY"=> "Belarus", 
    "BE"=> "Belgium", 
    "BZ"=> "Belize", 
    "BJ"=> "Benin", 
    "BM"=> "Bermuda", 
    "BT"=> "Bhutan", 
    "BO"=> "Bolivia, Plurinational State of", 
    "BQ"=> "Bonaire, Sint Eustatius and Saba", 
    "BA"=> "Bosnia and Herzegovina", 
    "BW"=> "Botswana", 
    "BV"=> "Bouvet Island", 
    "BR"=> "Brazil", 
    "IO"=> "British Indian Ocean Territory", 
    "BN"=> "Brunei Darussalam", 
    "BG"=> "Bulgaria", 
    "BF"=> "Burkina Faso", 
    "BI"=> "Burundi", 
    "KH"=> "Cambodia", 
    "CM"=> "Cameroon", 
    "CA"=> "Canada", 
    "CV"=> "Cape Verde", 
    "KY"=> "Cayman Islands", 
    "CF"=> "Central African Republic", 
    "TD"=> "Chad", 
    "CL"=> "Chile", 
    "CN"=> "China", 
    "CX"=> "Christmas Island", 
    "CC"=> "Cocos (Keeling) Islands", 
    "CO"=> "Colombia", 
    "KM"=> "Comoros", 
    "CG"=> "Congo", 
    "CD"=> "Congo, the Democratic Republic of the", 
    "CK"=> "Cook Islands", 
    "CR"=> "Costa Rica", 
    "CI"=> "Cote d'Ivoire", 
    "HR"=> "Croatia", 
    "CU"=> "Cuba", 
    "CW"=> "Curacao", 
    "CY"=> "Cyprus", 
    "CZ"=> "Czech Republic", 
    "DK"=> "Denmark", 
    "DJ"=> "Djibouti", 
    "DM"=> "Dominica", 
    "DO"=> "Dominican Republic", 
    "EC"=> "Ecuador", 
    "EG"=> "Egypt", 
    "SV"=> "El Salvador", 
    "GQ"=> "Equatorial Guinea", 
    "ER"=> "Eritrea", 
    "EE"=> "Estonia", 
    "ET"=> "Ethiopia", 
    "FK"=> "Falkland Islands (Malvinas)", 
    "FO"=> "Faroe Islands", 
    "FJ"=> "Fiji", 
    "FI"=> "Finland", 
    "FR"=> "France", 
    "GF"=> "French Guiana", 
    "PF"=> "French Polynesia", 
    "TF"=> "French Southern Territories", 
    "GA"=> "Gabon", 
    "GM"=> "Gambia", 
    "GE"=> "Georgia", 
    "DE"=> "Germany", 
    "GH"=> "Ghana", 
    "GI"=> "Gibraltar", 
    "GR"=> "Greece", 
    "GL"=> "Greenland", 
    "GD"=> "Grenada", 
    "GP"=> "Guadeloupe", 
    "GU"=> "Guam", 
    "GT"=> "Guatemala", 
    "GG"=> "Guernsey", 
    "GN"=> "Guinea", 
    "GW"=> "Guinea-Bissau", 
    "GY"=> "Guyana", 
    "HT"=> "Haiti", 
    "HM"=> "Heard Island and McDonald Islands", 
    "VA"=> "Holy See (Vatican City State)", 
    "HN"=> "Honduras", 
    "HK"=> "Hong Kong", 
    "HU"=> "Hungary", 
    "IS"=> "Iceland", 
    "IN"=> "India", 
    "ID"=> "Indonesia", 
    "IR"=> "Iran, Islamic Republic of", 
    "IQ"=> "Iraq", 
    "IE"=> "Ireland", 
    "IM"=> "Isle of Man", 
    "IL"=> "Israel", 
    "IT"=> "Italy", 
    "JM"=> "Jamaica", 
    "JP"=> "Japan", 
    "JE"=> "Jersey", 
    "JO"=> "Jordan", 
    "KZ"=> "Kazakhstan", 
    "KE"=> "Kenya", 
    "KI"=> "Kiribati", 
    "KP"=> "Korea, Democratic People's Republic of", 
    "KR"=> "Korea, Republic of", 
    "KW"=> "Kuwait", 
    "KG"=> "Kyrgyzstan", 
    "LA"=> "Lao People's Democratic Republic", 
    "LV"=> "Latvia", 
    "LB"=> "Lebanon", 
    "LS"=> "Lesotho", 
    "LR"=> "Liberia", 
    "LY"=> "Libya", 
    "LI"=> "Liechtenstein", 
    "LT"=> "Lithuania", 
    "LU"=> "Luxembourg", 
    "MO"=> "Macao", 
    "MK"=> "Macedonia, the former Yugoslav Republic of", 
    "MG"=> "Madagascar", 
    "MW"=> "Malawi", 
    "MY"=> "Malaysia", 
    "MV"=> "Maldives", 
    "ML"=> "Mali", 
    "MT"=> "Malta", 
    "MH"=> "Marshall Islands", 
    "MQ"=> "Martinique", 
    "MR"=> "Mauritania", 
    "MU"=> "Mauritius", 
    "YT"=> "Mayotte", 
    "MX"=> "Mexico", 
    "FM"=> "Micronesia, Federated States of", 
    "MD"=> "Moldova, Republic of", 
    "MC"=> "Monaco", 
    "MN"=> "Mongolia", 
    "ME"=> "Montenegro", 
    "MS"=> "Montserrat", 
    "MA"=> "Morocco", 
    "MZ"=> "Mozambique", 
    "MM"=> "Myanmar", 
    "NA"=> "Namibia", 
    "NR"=> "Nauru", 
    "NP"=> "Nepal", 
    "NL"=> "Netherlands", 
    "NC"=> "New Caledonia", 
    "NZ"=> "New Zealand", 
    "NI"=> "Nicaragua", 
    "NE"=> "Niger", 
    "NG"=> "Nigeria", 
    "NU"=> "Niue", 
    "NF"=> "Norfolk Island", 
    "MP"=> "Northern Mariana Islands", 
    "NO"=> "Norway", 
    "OM"=> "Oman", 
    "PK"=> "Pakistan", 
    "PW"=> "Palau", 
    "PS"=> "Palestinian Territory, Occupied", 
    "PA"=> "Panama", 
    "PG"=> "Papua New Guinea", 
    "PY"=> "Paraguay", 
    "PE"=> "Peru", 
    "PH"=> "Philippines", 
    "PN"=> "Pitcairn", 
    "PL"=> "Poland", 
    "PT"=> "Portugal", 
    "PR"=> "Puerto Rico", 
    "QA"=> "Qatar", 
    "RE"=> "Reunion", 
    "RO"=> "Romania", 
    "RU"=> "Russian Federation", 
    "RW"=> "Rwanda", 
    "BL"=> "Saint Barthelemy", 
    "SH"=> "Saint Helena, Ascension and Tristan da Cunha", 
    "KN"=> "Saint Kitts and Nevis", 
    "LC"=> "Saint Lucia", 
    "MF"=> "Saint Martin (French part)", 
    "PM"=> "Saint Pierre and Miquelon", 
    "VC"=> "Saint Vincent and the Grenadines", 
    "WS"=> "Samoa", 
    "SM"=> "San Marino", 
    "ST"=> "Sao Tome and Principe", 
    "SA"=> "Saudi Arabia", 
    "SN"=> "Senegal", 
    "RS"=> "Serbia", 
    "SC"=> "Seychelles", 
    "SL"=> "Sierra Leone", 
    "SG"=> "Singapore", 
    "SX"=> "Sint Maarten (Dutch part)", 
    "SK"=> "Slovakia", 
    "SI"=> "Slovenia", 
    "SB"=> "Solomon Islands", 
    "SO"=> "Somalia", 
    "ZA"=> "South Africa", 
    "GS"=> "South Georgia and the South Sandwich Islands", 
    "SS"=> "South Sudan", 
    "ES"=> "Spain", 
    "LK"=> "Sri Lanka", 
    "SD"=> "Sudan", 
    "SR"=> "Suriname", 
    "SJ"=> "Svalbard and Jan Mayen", 
    "SZ"=> "Swaziland", 
    "SE"=> "Sweden", 
    "CH"=> "Switzerland", 
    "SY"=> "Syrian Arab Republic", 
    "TW"=> "Taiwan, Province of China", 
    "TJ"=> "Tajikistan", 
    "TZ"=> "Tanzania, United Republic of", 
    "TH"=> "Thailand", 
    "TL"=> "Timor-Leste", 
    "TG"=> "Togo", 
    "TK"=> "Tokelau", 
    "TO"=> "Tonga", 
    "TT"=> "Trinidad and Tobago", 
    "TN"=> "Tunisia", 
    "TR"=> "Turkey", 
    "TM"=> "Turkmenistan", 
    "TC"=> "Turks and Caicos Islands", 
    "TV"=> "Tuvalu", 
    "UG"=> "Uganda", 
    "UA"=> "Ukraine", 
    "AE"=> "United Arab Emirates", 
    "GB"=> "United Kingdom", 
    "US"=> "United States", 
    "UM"=> "United States Minor Outlying Islands", 
    "UY"=> "Uruguay", 
    "UZ"=> "Uzbekistan", 
    "VU"=> "Vanuatu", 
    "VE"=> "Venezuela, Bolivarian Republic of", 
    "VN"=> "Viet Nam", 
    "VG"=> "Virgin Islands, British", 
    "VI"=> "Virgin Islands, U.S.", 
    "WF"=> "Wallis and Futuna", 
    "EH"=> "Western Sahara", 
    "YE"=> "Yemen", 
    "ZM"=> "Zambia", 
    "ZW"=> "Zimbabwe"]
    
    @subjects = []
    params[:program][:program_subjects].split(",").each do |f|
      @p = ProgramSubject.new(:program_id => params[:program][:id], :subject => f, :organization_id => Organization.where(:name => params[:program][:organization_name]).first.id)
      @p.save
      @subjects << @p
    end
    params[:program][:program_subjects] = @subjects
    
    @sizes = []
    params[:program][:program_sizes].split(",").each do |f|
      @p = ProgramSize.new(:program_id => params[:program][:id], :size => f, :organization_id => Organization.where(:name => params[:program][:organization_name]).first.id)
      @p.save
      @sizes << @p
    end
    params[:program][:program_sizes] = @sizes
    
    @cost_lengths = []
    params[:costs].each do |f|
      @p = ProgramCostLengthMap.new(:program_id => params[:program][:id], :cost => f.to_f, :organization_id => Organization.where(:name => params[:program][:organization_name]).first.id)
      @p.save
      @cost_lengths << @p
    end
    
    count = 0
    params[:lengths].each do |f|
      @p = @cost_lengths[count]
      @length = f.split(" ")
      @p.length = @length[0].to_i.send(@length[1]).to_f
      @p.length_name = @length[1]
      @p.length_number = @length[0]
      @p.save
      @p.index!
      @cost_lengths[count] = @p
      count = count + 1
    end
    
    params[:program][:program_cost_length_maps] = @cost_lengths
    
    @program = Program.new(params[:program])
    @program.location_name = @theCountries[@program.location]
    @program.organization_id = Organization.where(:name => @program.organization_name).first.id
    @program.truncated_description100 = RedCloth.new( ActionController::Base.helpers.sanitize(truncate @program.description, :length => 100), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
    @program.description = RedCloth.new( ActionController::Base.helpers.sanitize( @program.description ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
    @program.program_structure = RedCloth.new( ActionController::Base.helpers.sanitize( @program.program_structure ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
    @program.program_cost_breakdown = RedCloth.new( ActionController::Base.helpers.sanitize( @program.program_cost_breakdown ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html 
    @program.cost_includes = RedCloth.new( ActionController::Base.helpers.sanitize( @program.cost_includes ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
    @program.cost_doesnt_include = RedCloth.new( ActionController::Base.helpers.sanitize( @program.cost_doesnt_include ), [:filter_html, :filter_styles, :filter_classes, :filter_ids] ).to_html
    
    
    if (@program.overall.nil?) 
      @program.overall= 0;
    end
    
    if @program.check_it_out[0..3] != "http"
      @program.check_it_out = "http://"+@program.check_it_out
    end

    
    @chart = @program.chart.split("#")
    if @chart.class.name == "Array"
      @program.chart = @chart[0]
    end

    if user_signed_in? && current_user.admin?
      if @program.save
            redirect_to "/programs/#{@program.id}/crop"
      else
        @program.description = @program.description.gsub(%r{</?[^>]+?>}, '')
        @program.program_structure = @program.program_structure.gsub(%r{</?[^>]+?>}, '')
        @program.program_cost_breakdown = @program.program_cost_breakdown.gsub(%r{</?[^>]+?>}, '')
        @program.cost_includes = @program.cost_includes.gsub(%r{</?[^>]+?>}, '')
        @program.cost_doesnt_include = @program.cost_doesnt_include.gsub(%r{</?[^>]+?>}, '')
         render :action => "new" 
      end
   end
end

  # PUT /programs/1
  # PUT /programs/1.json
  def update
    @program = Program.find(params[:id])
      if user_signed_in? && current_user.admin?
      if @program.update_attributes(params[:program])
            redirect_to "/programs/#{@program.id}"
      else
         render :action => "edit" 
      end
   end
  end

  # DELETE /programs/1
  # DELETE /programs/1.json
  def destroy
    @program = Program.find(params[:id])
    @program.destroy

    respond_to do |format|
      format.html { redirect_to programs_url }
      format.json { head :no_content }
    end
  end
  
end
